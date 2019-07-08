#!/bin/bash -x

INSTANCE_ID=`curl http://169.254.169.254/latest/meta-data/instance-id`
PRIVATE_IP=`curl http://169.254.169.254/latest/meta-data/local-ipv4`
EC2_AVAIL_ZONE=`curl -s http://169.254.169.254/latest/meta-data/placement/availability-zone`
EC2_REGION=`curl http://169.254.169.254/latest/dynamic/instance-identity/document/ | grep region |awk -F\" '{print $4}'`

mkdir /var/jenkins_home/
yum install -y -q nfs-utils bind-utils

mount_dns="${efs_id}.efs.$EC2_REGION.amazonaws.com"
mount_ip=$(dig +short $mount_dns)

while [ "$mount_ip" = "" ]
do
  echo "dns for mount unresolved, sleeping 10"
  sleep 10
  mount_ip=$(dig +short $mount_dns)
done

echo "$mount_dns:/ /var/jenkins_home/ nfs4 nfsvers=4.1,rsize=1048576,wsize=1048576,hard,timeo=600,retrans=2 0 0" >> /etc/fstab

mount -a -t nfs4

yum remove -y docker \
    docker-common \
    docker-selinux \
    docker-engine

yum-config-manager \
    --add-repo \
    https://download.docker.com/linux/centos/docker-ce.repo

yum install -y yum-utils \
    device-mapper-persistent-data \
    lvm2 \
    docker-ce

systemctl start docker
systemctl enable docker

mkdir -p /etc/nginx

cat > /etc/ssl/key.pem<<'EOL'
${ssl_key}
EOL

cat > /etc/ssl/cert.pem<<'EOL'
${ssl_cert}
EOL


cat > /etc/nginx/nginx.conf<<'EOL'
# For more information on configuration, see:
#   * Official English Documentation: http://nginx.org/en/docs/
#   * Official Russian Documentation: http://nginx.org/ru/docs/
user nginx;
worker_processes auto;
error_log /var/log/nginx/error.log;
pid /run/nginx.pid;
events {
    worker_connections 1024;
}
http {
    log_format  main  '$remote_addr - $remote_user [$time_local] "$request" '
                      '$status $body_bytes_sent "$http_referer" '
                      '"$http_user_agent" "$http_x_forwarded_for"';
    access_log  /var/log/nginx/access.log  main;
    client_max_body_size 75m;
    sendfile            on;
    tcp_nopush          on;
    tcp_nodelay         on;
    keepalive_timeout   65;
    types_hash_max_size 2048;
    include             /etc/nginx/mime.types;
    default_type        application/octet-stream;
    # Load modular configuration files from the /etc/nginx/conf.d directory.
    # See http://nginx.org/en/docs/ngx_core_module.html#include
    # for more information.
    include /etc/nginx/conf.d/*.conf;
  server {
  	listen 80 default_server;
  	listen [::]:80 default_server;
  	server_name _;
  	return 301 https://$host$request_uri;
  }

  server {

    server_name  "";

    listen 443 ssl;
    listen [::]:443 ssl;

    ssl    on;
    ssl_certificate    /etc/ssl/cert.pem;
    ssl_certificate_key    /etc/ssl/key.pem;
    location / {
				proxy_set_header Host $host;
				proxy_set_header X-Real-IP $remote_addr;
				proxy_pass http://localhost:8080;
    }
  }
}
EOL


docker run -d \
  -v /etc/nginx/nginx.conf:/etc/nginx/nginx.conf:ro \
  -v /etc/ssl/:/etc/ssl/:ro \
  --restart=always --net=host --name NGINX \
  nginx:alpine

docker run -d \
  --restart=always --net=host --name JENKS \
  --mount 'type=volume,src=JENKINS_MOUNT,volume-driver=local,dst=/var/jenkins_home,volume-opt=type=nfs,volume-opt=device=:/,"volume-opt=o=addr='$mount_dns',vers=4,hard,timeo=600,rsize=1048576,wsize=1048576,retrans=2"' \
  jenkins/jenkins:lts

if [ "${plugins}x" != "x" ]
then
    docker exec JENKS /usr/local/bin/install-plugins.sh ${plugins}
    docker restart JENKS
fi

${append_script}

#!/bin/bash
# This dead-simple script allows us to provide a plugins.txt, or not.
# If we used "${file("plugins.txt")}" instead, terraform would fail if there is no plugins.txt file
# Contents of plugins.txt should be newline-separated plugin names. Basically, the output of
#    curl -s -k "http://admin:admin@localhost:8080/pluginManager/api/json?depth=1" \ | jq -r '.plugins[].shortName'
# as described here: https://technologyconversations.com/2017/06/16/automating-jenkins-docker-setup/

if [ -e "$(pwd)/plugins.txt" ]; then
    PLUGS=$(cat plugins.txt | tr '\n' ' ')
fi
echo "{\"plugins\": \""${PLUGS}"\"}"

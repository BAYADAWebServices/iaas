$c_downloads = "c:\downloads\"

if((test-path $c_downloads) -eq $false) {
    New-Item -Path "C:\" -Name "downloads" -ItemType "directory"
    write-host "Folder created: $c_downloads"
} else {
    write-host "Folder exists: $c_downloads"
}
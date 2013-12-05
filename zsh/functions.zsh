#!/bin/sh
function proxy()
{
    echo -n "username:"
    read username
    echo -n "password:"
    read -s password
    export http_proxy="http://$username:$password@proxyserver:port/"
    export HTTP_PROXY=$http_proxy
    export https_proxy=$http_proxy
    export HTTPS_PROXY=$http_proxy
    export ftp_proxy=$http_proxy
    export FTP_PROXY=$http_proxy
    export rsync_proxy=$http_proxy
    export RSYNC_PROXY=$http_proxy
    export no_proxy="localhost,127.0.0.1,localaddress,.localdomain.com"
    echo -e "\nProxy environment variable set."
}
function proxyoff()
{
    unset HTTP_PROXY
    unset http_proxy
    unset HTTPS_PROXY
    unset https_proxy
    unset FTP_PROXY
    unset ftp_proxy
    unset RSYNC_PROXY
    unset rsync_proxy
    echo -e "\nProxy environment variable removed."
}

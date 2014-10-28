#!/bin/sh
autoload zmv

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
function xvncon()
{
    /usr/bin/x11vnc -rfbauth ~/.vnc/passwd -forever -rfbport 5900 &
}
function xvncoff()
{
    killall x11vnc
}
function vncon()
{
    /usr/bin/vncserver :1 -geometry 1920x1080
}
function vncoff()
{
    /usr/bin/vncserver -kill :1
}
function py2on()
{
    sudo rm /usr/bin/python
    sudo ln -s /usr/bin/python2 /usr/bin/python
}
function py2off()
{
    sudo rm /usr/bin/python
    sudo ln -s /usr/bin/python3 /usr/bin/python
}

#!/bin/bash

clear
echo "installing Dead Watchmen"
sleep 2

if [[ $EUID -ne 0 ]]; then
   echo "This script must be run as root" 
   exit 1
fi

if [ "$PREFIX" = "/data/data/com.termux/files/usr" ]; then
    INSTALL_DIR="$PREFIX/usr/share/doc/Dead-Watchmen"
    BIN_DIR="$PREFIX/bin/"
    BASH_PATH="$PREFIX/bin/bash"
    TERMUX=true

    pkg install -y sl git python3-pip python3 python-pip
else
    INSTALL_DIR="$HOME/.Dead-Watchmen"
    BIN_DIR="/usr/local/bin/"
    BASH_PATH="/bin/bash"
    TERMUX=false

    apt install -y sl python3-pip python3 python-pip

sudo pip3 install -r requirements.txt

fi
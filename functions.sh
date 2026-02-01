#!/bin/bash

USERID=$(id -u)
if [ $USERID -ne 0 ]; then
    echo "Please run this script with root user access"
    exit 1
fi

echo "Installing nginx..."
dnf install nginx -y

if [ $? -ne 0 ]; then #to know whether (dnf install nginx -y) command success or not
    echo "Installing nginx is FAILURE"
else 
    echo "Installing nginx is SUCCESS"
fi


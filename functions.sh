#!/bin/bash

# USERID=$(id -u)
# if [ $USERID -ne 0 ]; then
#     echo "Please run this script with root user access"
#     exit 1
# fi

# echo "Installing nginx..."
# dnf install nginx -y

# if [ $? -ne 0 ]; then #to know whether (dnf install nginx -y) command success or not
#     echo "Installing nginx is FAILURE"
# else 
#     echo "Installing nginx is SUCCESS"
# fi


USERID=$(id -u)
if [ $USERID -ne 0 ]; then
    echo "Please run this script with root user access"
    exit 1
fi

VALIDATE(){
if [ $1 -ne 0 ]; then 
    echo "$2 is FAILURE"
else 
    echo "$2 is SUCCESS"
fi
}

dnf install nginx -y
VALIDATE $?, "Installing nginx"

dnf install mysql -y
VALIDATE $?, "Installing mysql"

dnf install nodejs -y
VALIDATE $?, "Installing nodejs"
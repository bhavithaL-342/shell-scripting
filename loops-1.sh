#!/bin/bash

USERID=$(id -u)

LOGS_FOLDER="/var/log/shell-script"
LOGS_FILE="/var/log/shell-script/$0.log"





if [ $USERID -ne 0 ]; then
    echo "Please run this script with root user access" | tee -a $LOGS_FILE
    exit 1
fi

VALIDATE(){
if [ $1 -ne 0 ]; then 
    echo "$2 is FAILURE" | tee -a $LOGS_FILE #tee -> prints log/output on screen and in log file, -a is append(without override)
else 
    echo "$2 is SUCCESS" | tee -a $LOGS_FILE
fi
}

for package in $@ #sudo sh loops.sh nginx mysql nodejs   
do
    dnf list installed $package &>> $LOGS_FILE #will say whether the package already installed or not and run echo $?-> if 0 installed else no
    dnf install $package -y &>> $LOGS_FILE
    VALIDATE $? "$package installation"
done
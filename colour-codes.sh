#!/bin/bash

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m" #normal

USERID=$(id -u)

LOGS_FOLDER="/var/log/shell-script"
LOGS_FILE="/var/log/shell-script/$0.log"


if [ $USERID -ne 0 ]; then
    echo -e "$R Please run this script with root user access $N" | tee -a $LOGS_FILE
    exit 1
fi

VALIDATE(){
if [ $1 -ne 0 ]; then 
    echo -e "$2 is $R FAILURE $N" | tee -a $LOGS_FILE #tee -> prints log/output on screen and in log file, -a is append(without override)
else 
    echo -e "$2 is $G SUCCESS $N" | tee -a $LOGS_FILE
fi
}

for package in $@ #sudo sh loops.sh nginx mysql nodejs   
do
    dnf list installed $package &>> $LOGS_FILE #will say whether the package already installed or not and run echo $?-> if 0 installed else no
    if [ $? -ne 0 ]; then
        echo -e "$package not installed, $Y installing now $N"
        dnf install $package -y &>> $LOGS_FILE
        VALIDATE $? "$package installation"
    else
        echo -e "$package already installed, $Y skipping $N"
    fi
done
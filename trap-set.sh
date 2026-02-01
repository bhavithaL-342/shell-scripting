#!/bin/bash

#set -e #this will check for errors, if error it will exit, but it won't print log, log in -> sudo less /var/log/shell-script/set.sh log

set -e #ERR
trap 'echo "There is an error in $LINENO , Command: $BASH_COMMAND"' ERR #set 
R="\e[31m"
G="\e[32m"          #-e must to enable colour code
Y="\e[33m"
N="\e[0m" #normal


echo "Hi everyone, wellcome back"
echo "Today we will learn shell"
echoo "This line contains error"
echo "This is the final line"

#!/bin/bash

echo "All args passed to script: $@"
echo "Number of variables passed: $#"
echo "script name: $0"
echo "Present working directory: $PWD"
echo "who is running: $USER"
echo "Home directory of current user: $HOME"
echo "PID of the script: $$"
sleep 100 &
echo "PID of recently executed background process: $!"
echo "All args passed to script: $*"  # $* takes all args as one string(so will use $@)
#!/bin/bash

USERID=$(id -u)
R="\e[31m"
G="\e[32m"
N="\e[0m"

CHECK_ROOT()
{
    if [ $USERID -ne 0 ]
    then
      echo "please run this script with root priviliges"
      exit 1
    fi
}

VALIDATE(){
    if [ $1 -ne 0 ]
    then
        echo -e "$2 is...$R FAILED $N"
        exit 1
    else
        echo -2 "$2 is...$G SUCCESS $N"
    fi
}

CHECK_ROOT

for package in $@
do
    dnf list installed $package
    if [ $? -ne 0 ]
    then
      echo "git is not installed, going to install"
      dnf install git -y
      VALIDATE $? "installing $PACKAGE"
    else
      echo "$package is already installed.nothing to do"
    fi
done

#!/bin/bash

LOGS_FOLDER="/var/log/shell-scripts"
SCRIPT_NAME=$(echo $0 | cut -d "." -f1)
TIMESTAMP=$(date +%y-%m-%d-%H-%M-%S)
LOG_FILE="$LOGS_FOLDER/$SCRIPT_NAME-$TIMESTAMP.log"
mkdir -p $LOGS_FOLDER

USERID=$(id -u)
R="\e[31m"
G="\e[32m"
N="\e[0m"
Y="\e[33m"

CHECK_ROOT()
{
    if [ $USERID -ne 0 ]
    then
      echo -e "$R please run this script with root priviliges $N" &>>$LOG_FILE
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

USAGE(){
    echo  -e "$R USAGE:: $N sudo sh 15-redirectors.sh package1 package2..."
    exit 1

}

CHECK_ROOT

if [ $# -eq 0 ]
then 
    USAGE
fi

for package in $@
do
    dnf list installed $package &>>$LOG_FILE
    if [ $? -ne 0 ]
    then
      echo "git is not installed, going to install" &>>$LOG_FILE
      dnf install $package -y &>>$LOG_FILE
      VALIDATE $? "installing $package"
    else
      echo -e "$package is already  installed.nothing to do" &>>$LOG_FIL
    fi
done
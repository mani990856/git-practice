#!/bin/bash

USERID=$(id -u)
#echo "userId is :$USERID"

if [ $USERID -ne 0 ]
then
 echo "please run this sript with root priveges"
 exit 1
fi

dnf list installed git

if [ $? -ne 0 ]
then
  echo "git is not installed, going to installed"
  dnf install git -y

else
  echo "git is already installed, nothing to do"
fi


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
  if [ $? -ne 0 ]
  then
   echo "git installation is not success.check it once"
   exit 1
  else 
   echo "git installation is success"

else
  echo "git is already installed, nothing to do"
fi


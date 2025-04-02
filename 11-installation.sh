#!/bin/bash

USERID=$(id -u)
#echo "userId is :$USERID"

if [ $USERID -ne 0 ]
then
 echo "please run this sript with root priveges"
 exit 1
fi

dnf install git -y

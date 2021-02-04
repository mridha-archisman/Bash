#! /usr/bin/bash

echo "Executing script"

echo $ZSH

name=archisman
echo my name is $name

echo "What is your name ? "
read name
echo "Ok ! you are $name"

echo "Enter some numbers"
read -a numbers
echo "You entered ${ numbers[0] }"

count=10

if [ "$count" > "10" ]
then
    echo "Condition Satisfied"
else
    echo "Condition not satisfied"
fi

read -p "Enter file name : " name

if [ -e "$name" ]
then
    echo "File found"
else
    echo "File not found"
fi
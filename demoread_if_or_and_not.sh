#!/usr/bin/env bash

<<summary
Logical AND Operator && or -a
 will compare two inputs & if both are true, it will return true else false.
Logical OR Operator || or -o
 Will check two conditions will return true, if any of them is true & return false when both are false.
Logical NOT Operator !
 will return true when the condition is false & return false if the condition is true.
summary

<<demonot
vagrant@lab1:~$ test 3 -gt 1
vagrant@lab1:~$ echo $?
0
vagrant@lab1:~$ [[ 3 -gt 1 ]]               #same as test 3 -gt 1
vagrant@lab1:~$ echo $?
0
vagrant@lab1:~$ [[ ! 3 -gt 1 ]]             #! changes result of test to inverse...same as [ ! 3 -gt 1 ]
vagrant@lab1:~$ echo $?
1
demonot

read -p "Enter a number: " num
#&& will compare two inputs (can be command inputs) & if both are true, it will return true else false.
#if [[ $num -ge 50 ]] && [[ $num -le 100 ]]
#OR ,you can remove the internal brackets
#if [[ $num -ge 50 && $num -le 100 ]]
#OR if using -a (old way) instead of && it must be [] and not [[ ]]
if [ $num -ge 50 -a $num -le 100 ]
then
    echo "$num is between 50 and 100"
else
    echo "$num is not between 50 and 100"
fi

#Difference between [[ ]] and []
read -p "Enter yes or no: "
if [[ $REPLY == yes ]]          #not compulsory for variable and strings to be in quotes
#OR use -o with single [ ]
#if [ "$REPLY" == "yes"  ]       #variable and strings MUST be in quotes else an empty REPLY will result in this error "[: =: unary operator expected"
then
    echo "you entered yes"
else
    echo "you entered no"
fi

#EXAMPLE 2
read -p "Enter yes or no: "
if [[ $REPLY == "yes" || $REPLY == "y"  ]]
#OR [[ ]] supports regular expression but [ ] doesnt support regex
#if [[ $REPLY =~ y|yes  ]]          #regex must not be quoted like 'y|yes' else test will fail
#OR use -o with single [ ]
#if [ $REPLY == "yes" -o $REPLY == "y"  ]       #
then
    echo "you entered yes"
else
    echo "you entered no"
fi
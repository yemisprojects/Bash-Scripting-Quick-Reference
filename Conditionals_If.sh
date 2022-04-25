#!/usr/bin/env bash
#test syntax and if syntax
#The test command evaluates the expression and, if it evaluates to true, returns a zero (true) exit status; otherwise it returns 1 (false). 
#The syntax is:
: '
test condition  
test condition && do_something || do_nothing_due_to_false
[ condition ] && do_something || do_nothing_due_to_false
'
#The syntax with if command is as follows:
: '
if [ condition ]; then
       do_run_this_due_to_true_condition
else
       do_run_this_due_to_false_condition
fi
'


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

#MULTIPLE WAYS TO RUN THE SAME PROGRAM

#METHOD 1
# sudo -v 1>/dev/null 2>&1 && echo "user is has sudo priviledges" || echo "user does not have sudo priviledges"

#METHOD 2
sudo -v  1>/dev/null 2>&1
check=$(echo $?)

if [[ $check -eq 0 ]]
then
	echo "user $(id -un) has sudo priviledges"              #identation is not required here. It's just for best practice
else
	echo "user $(id -un) does not have sudo priviledges"        #identation is not required here. It's just for best practice
fi

# METHOD 3 - You can add the command to the if statement, if cmd executes successfully it returns true or 0 else return false or non-zero
if sudo -v 1>/dev/null 2>&1
then
        echo "user $(id -un) has sudo priviledges"
else
        echo "user $(id -un) does not have sudo priviledges"
fi


if sudo systemctl status docker 1>/dev/null 2>&1
then
        echo "Docker is already running"
else
        echo "Will start docker now"
        sudo systemctl start docker
        echo "Docker is running now"
fi

#Difference between [[ ]] and []
read -p "Enter yes or no: "
if [[ $REPLY == yes ]]          #not compulsory for variable and strings to be in quotes
#if [[ $REPLY = yes ]]          same
#OR use -o with single [ ]
#if [ "$REPLY" == "yes"  ]       #variable and strings MUST be in quotes else an empty REPLY will result in this error "[: =: unary operator expected"
then
    echo "you entered yes"
else
    echo "you entered no"
fi



# x=5
# y=10
# [[ $x -gt $y ]]
# echo $?

# x=51
# y=10
# [ "$x" -gt "$y" ] 
# echo $?

# [[  $x -gt $y  ]] && echo "Yes \$x is > \$y" || echo "No \$x is not > \$y"


# read -p "Enter a number (must be greater than 20) : " n
# if test $n -gt 20
#  then
#     echo "$n is greater than 20."
# else
#     echo "You are not following my instructions."
# fi


# read -p "Enter a number (must be greater than 20) : " n
# if [[ $n -gt 20 ]]
# then
#     echo "$n is greater than 20."
# else
#     echo "You are not following my instructions."
# fi


# if [ 2 -gt 3 ]
# then
#      echo "2 is greater"
# else
#      echo "2 is not greater"
# fi

# Script to do numeric comparisons
# var1=10
# var2=20
# if [ $var2 -gt $var1 ]
# then
#         echo "$var2 is greater than $var1"
# fi
# # Second comparison
# if [ $var1 -gt 30 ]
# then
#         echo "$var is greater than 30"
# else
#         echo "$var1 is less than 30"
# fi


# Script to do string equality comparison
# name=linuxtechi
# if [ $USER = $name ]
#         then
#                 echo "User exists"
#         else
#                 echo "User not found"
# fi
# # script to check string comparisons
# var1=a
# var2=z
# var3=Z
# if [[ $var1 > $var2 ]]
#         then
#                 echo "$var1 is greater"
#         else
#                 echo "$var2 is greater than $var1"
# fi
# # Lower case  & upper case comparisons 
# if [ $var3 \> $var1 ]                       #Note the use of \ when using [], without escape character it will throw an error
#         then
#                 echo "$var3 is greater"
#         else
#                 echo "$var1 is greater than $var3"
# fi

# Script to see if the variable holds value or not
# var1=" "
# var2=linuxtechi
# if [ -n "$var2" ]
#         then
#                 echo "string  is not empty"
#         else
#                 echo "string provided is empty"
# fi

# if [ -z "$var2" ]
#         then
#                 echo "string is empty"
#         else
#                 echo "string provided is not empty"
# fi


# Script to check file comparison
dir="/home/linuxtechi"
#dir="/Users/yemi/vagrant_boxes/trash"
if [ -d "$dir" ]
then
    echo -e "============================\n$dir is a directory\n=============================="
    cd $dir
    ls
else
    echo "$dir does not exist"
fi


# NUM=6
# if [ $NUM -gt 10 ]
# then
#     echo "$NUM is higher than 10"
# else
#     echo "$NUM is lower than 10"
# fi
#!/usr/bin/env bash
MULTIPLE WAYS TO RUN THE SAME PROGRAM

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
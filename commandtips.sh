#!/usr/bin/env bash
#Start with env bash so your script can be run anywhere

#Multiline argument

#Redirection Operators STDIN,STDOUT and STDERR. Note that some commands send success output to stderr such as `java -v``
<<redirect_demo
1>file1 redirects stdout(aka success) output to file1
2>file2 redirects stderr(aka error) output to file2

1>file1 2>file1 both stdout and stderr will redirect to same file1
1>file1 2>&1    both stdout and stderr  will redirect to same file1;MAKE SURE  2>&1 comes after 1>file1
&>file1         both stdout and stderr will redirect to same file1

cat < advanced-demo.sh     read a file by redirecting 
redirect_demo

#How to pass multiline strings to a command. EOF and DELIM can be anything, but must close with same text
<<DemoMultiline
$ cat << EOF > tests.txt                #EXAMPLE 1 terminal
> line1
> line2
> EOF
$ cat tests.txt
line1
line2

cat << DELIM | grep direc               #EXAMPLE 2 in script
user: $USER
HOME directory $HOME
DELIM

DemoMultiline

#When using comparison and file test operator you must use [[ ]] or [ ]


#difference between su - username and sudo su username
#If you omit the hyphen, you log in to the other user's account with your environment variables, which might cause different results from what the user would experience when logging in to the system
<< demo_su
vagrant@lab1:~$ su - automation     #prompted for automation user password. 
Password:

vagrant@lab1:~$ sudo su - automation    #with sudo priviledge you will be logged in directly
No directory, logging in with HOME=/
$

vagrant@lab1:~$ sudo su -       #switch to root user, no need to specify a name
root@lab1:~#
demo_su

#2 ways to give user sudo access
<<demo-create-sudouser
sudo adduser username       #create user with home directory
add user to sudo group with `usermod -aG sudo username`
Or add user to /etc/sudoers file using visudo command which checks for syntax errors
username  ALL=(ALL) NOPASSWD:ALL            #allows user to run all sudo commands without a password prompt
username ALL=(ALL) NOPASSWD:/bin/mkdir,/bin/rmdir  #restricts user to specific sudo commands without a password prompt
demo-create-sudouser

#How to chain commands together. Don't put commands in the test operator [[ ]]
<<command_chaining
cmd1 ; cmd2 Run cmd1 and then cmd2, regardless of the success or failure of cmd1
cmd1 && cmd2 Run cmd2 only if cmd1 succeeded
cmd1 || cmd2 Run cmd2 only if cmd1 failed
cmd1 && cmd2 || cmd3 Run cmd2 if cm1 is success else run cmd3

sudo -v && echo "user is has sudo priviledges" || echo "user does not have sudo priviledges"        #In Example sudo -v is a command so dont use a test block, [[ ]]
command_chaining
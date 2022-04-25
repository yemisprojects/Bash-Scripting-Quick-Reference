#Variables can be used to store different data types. Integer, string, float, double and Boolean
#BASH is a weakly typed programming language that does not require to define any data type at the time of variable declaration. 
#So when any numeric value assigns to a variable then it will work as integer and when any text value assigns to a variable then it is string
letter='c'      #character          #DO NOT PUT A SPACE BETWEEN =
color='blue'       #string
year=2020           #integer

#Good tutorial: https://linuxhint.com/variables-bash-programming/
#https://www.howtogeek.com/442332/how-to-work-with-variables-in-bash/
#https://ryanstutorials.net/bash-scripting-tutorial/bash-variables.php

#This sets a Constant variable whose value cannot be changed
<<variable1
~/vagrant_boxes/trash$ readonly PI=3.14159
~/vagrant_boxes/trash$ PI=2
zsh: read-only variable: PI
~/vagrant_boxes/trash$ echo $PI
3.14159
variable1

#Command substitutions
#The ability to store the output of a command into a variable is called command substitution. 2 ways are using quotes or parenthesis
<<variable1
Syntax 
variable=$(command)                                 #NEW WAY

~/vagrant_boxes/trash$ TODAY=$(date)
~/vagrant_boxes/trash$ echo $TODAY
Wed 20 Apr 2022 03:45:44 EDT
~/vagrant_boxes/trash$ TODAY=`date`                 #OLD WAY                                  
~/vagrant_boxes/trash$ echo $TODAY
Wed 20 Apr 2022 03:46:01 EDT
~/vagrant_boxes/trash$
variable1

<<Combining-two-string-variables
~/vagrant_boxes/trash$ var2="I am this age: "
~/vagrant_boxes/trash$ var1=12
~/vagrant_boxes/trash$ echo $var2$var1          #You dont need to print the values in quotation. 
I am this age: 12
~/vagrant_boxes/trash$ echo "$var2$var1"        #If quotations are used, use double quotations
I am this age: 12
Combining-two-string-variables

<<Concatenating-strings-with-variables 
~/vagrant_boxes/trash$ var="BASH"
~/vagrant_boxes/trash$ echo "$var program"          #using "" allows you to read data from the variable
BASH program
~/vagrant_boxes/trash$ echo "$var+program"          #bash is smart enough to read variable name seperate from + character
BASH+program
~/vagrant_boxes/trash$ echo '$var program'             #using '' disables reading data from the variable
$var program
Concatenating-strings-with-variables

<<numeric-variables
~/vagrant_boxes/trash$ n=100
~/vagrant_boxes/trash$ echo $n
100
~/vagrant_boxes/trash$ echo $n+20
100+20
~/vagrant_boxes/trash$ echo $n
100
~/vagrant_boxes/trash$ (( n=n+20 ))         #NOTE it is not compulsory to reference the variable n with $n when within (( ))
~/vagrant_boxes/trash$ echo $n
120
numeric-variables

<<bc-bashcalculator
~/vagrant_boxes/trash$ n=55
~/vagrant_boxes/trash$ echo $n/10 | bc              #fractional part removed
5
~/vagrant_boxes/trash$ echo $n/10 | bc -l
5.50000000000000000000
~/vagrant_boxes/trash$ echo "scale=2;$n/10" | bc -l             #rounded to 2 decimal places. Scale must come before the mathematical expression
5.50
~/vagrant_boxes/trash$
bc-bashcalculator

#Note local and global variable values
: '
~/vagrant_boxes/trash$ cat script.sh
#!/bin/bash
n=5
function addition()
{
local n=6
local m=4
(( n=n+m ))
echo "n within function is: $n"

}
addition
echo "n outside function is: $n"

~/vagrant_boxes/trash$ bash script.sh
n within function is: 10
n outside function is: 5
~/vagrant_boxes/trash$
'


#How to reference array values and keys
#other online blog: https://www.freecodecamp.org/news/bash-array-how-to-declare-an-array-of-strings-in-a-bash-script/
<<using_array_variables
~/vagrant_boxes/trash$ cat script.sh                    #Demo array script
#!/bin/bash

myarr=(HTML JavaScript PHP jQuery AngularJS CodeIgniter)

#Count total number of elements of the array
total=${#myarr[*]}
echo "Total elements: $total"

#Print each element value of the array
echo "Array values :"
for val in ${myarr[*]}
do
printf "   %s\n" $val
done

#Print each element value of the array with key

echo "Array values with key:"
for key in ${!myarr[*]}
do
printf "%4d: %s\n" $key ${myarr[$key]}
done
~/vagrant_boxes/trash$ bash script.sh                   #Demo Run
Total elements: 6
Array values :
   HTML
   JavaScript
   PHP
   jQuery
   AngularJS
   CodeIgniter
Array values with key:
   0: HTML
   1: JavaScript
   2: PHP
   3: jQuery
   4: AngularJS
   5: CodeIgniter
~/vagrant_boxes/trash$
using_array_variables


<<Special_Variables
$#: How many command line parameters were passed to the script.
$@: All the command line parameters passed to the script.
$?: The exit status of the last process to run.
$$: The Process ID (PID) of the current script.
$USER: The username of the user executing the script.
$HOSTNAME: The hostname of the computer running the script.
$SECONDS: The number of seconds the script has been running for.
$RANDOM: Returns a random number.
$LINENO: Returns the current line number of the script.


~/vagrant_boxes/trash$ cat special.sh                   #DEMO SCRIPT
#!/bin/bash

echo "There were $# command line parameters"
echo "They are: $@"
echo "Parameter 1 is: $1"
echo "The script is called: $0"
# any old process so that we can report on the exit status
pwd
echo "pwd returned $?"
echo "This script has Process ID $$"
echo "The script was started by $USER"
echo "It is running on $HOSTNAME"
sleep 3
echo "It has been running for $SECONDS seconds"
echo "Random number: $RANDOM"
echo "This is line number $LINENO of the script"
~/vagrant_boxes/trash$ bash special.sh alpha bravo 1 2018 tueday        #DEMO Run
There were 5 command line parameters
They are: alpha bravo 1 2018 tueday
Parameter 1 is: alpha
The script is called: special.sh
/Users/yemi/vagrant_boxes/trash
pwd returned 0
This script has Process ID 47555
The script was started by yemi
It is running on Yemis-Mac.local
It has been running for 3 seconds
Random number: 14182
This is line number 16 of the script
~/vagrant_boxes/trash$
Special_Variables


<<CommandSubstitution
Command substitution allows us to take the output of a command or program (what would normally be printed to the screen) and save it as the value of a variable. 
To do this we place it within brackets, preceded by a $ sign.

~/vagrant_boxes/trash$ myvar=$( ls /etc | wc -l )
~/vagrant_boxes/trash$ echo There are $myvar entries in the directory /etc

There are       82 entries in the directory /etc
~/vagrant_boxes/trash$

Command substitution is nice and simple if the output of the command is a single word or line. 
If the output goes over several lines then the newlines are simply removed and all the output ends up on a single line.             #CAUTION


~/vagrant_boxes/trash$ cat testcommand.sh                                                               #Demo Script
#!/bin/bash

echo -e "This is long list format \n==========================="
ls -l

echo -e "\n===========================\nThis is long list format using command substitution\n==========================="
myvar=$(ls -l)
echo $myvar
~/vagrant_boxes/trash$ bash testcommand.sh                                                          #Demo run showing line breaks being removed
This is long list format
===========================
total 56
-rw-r--r--  1 yemi  staff   18 20 Apr 02:57 alphabetical-file.txt
-rw-r--r--  1 yemi  staff  199 21 Apr 03:10 array.sh
-rw-r--r--  1 yemi  staff  144 13 Apr 00:34 err.txt
drwxr-xr-x  3 yemi  staff   96 12 Apr 01:32 html
-rw-r--r--  1 yemi  staff   18 20 Apr 02:57 mylist.txt
-rw-r--r--  1 yemi  staff  436 21 Apr 01:34 script.sh
-rw-r--r--  1 yemi  staff  467 21 Apr 02:47 special.sh
-rw-r--r--  1 yemi  staff    0 13 Apr 00:34 succ.txt
-rw-r--r--  1 yemi  staff  234 21 Apr 11:05 testcommand.sh

===========================
This is long list format using command substitution
===========================
total 56 -rw-r--r-- 1 yemi staff 18 20 Apr 02:57 alphabetical-file.txt -rw-r--r-- 1 yemi staff 199 21 Apr 03:10 array.sh -rw-r--r-- 1 yemi staff 144 13 Apr 00:34 err.txt drwxr-xr-x 3 yemi staff 96 12 Apr 01:32 html -rw-r--r-- 1 yemi staff 18 20 Apr 02:57 mylist.txt -rw-r--r-- 1 yemi staff 436 21 Apr 01:34 script.sh -rw-r--r-- 1 yemi staff 467 21 Apr 02:47 special.sh -rw-r--r-- 1 yemi staff 0 13 Apr 00:34 succ.txt -rw-r--r-- 1 yemi staff 234 21 Apr 11:05 testcommand.sh
~/vagrant_boxes/trash$

CommandSubstitution


<<ExportingVariables
Read links below on demo on how to export variables. 

When variables are exported to another called script, whatever change is made to the variable in the called/child script does not affect
the value of the variables in the calling/Parent script

https://www.howtogeek.com/442332/how-to-work-with-variables-in-bash/
https://ryanstutorials.net/bash-scripting-tutorial/bash-variables.php#commandsubstitution


ExportingVariables

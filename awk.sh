#syntax of awk

awk [options] 'pattern/condition {action}' data_filename
command | awk [options] 'pattern/condition {action}'
awk '{}'                                    #this are the only manadatory fields; without a print statement no data will be displayed to standard out

#awk scripting syntax
awk [options] 'BEGIN {start_action} pattern/condition {action} END {stop_action}' filename
awk -f awk_script.awk data_filename                  #The logic in quotes will be in the awk_script.awk file, while filename is where daata is
./awk_script.awk data_filename                   #Shebang line must be included 

action: will be performed on each line without a pattern or condition. Think of it like a for loop reading through each line and action is commands to be executed on each line
pattern: is a condition or search string
-F field_seperator
-v var=value declare a variable
-f file
BEGIN {start_action} : is performed before reading the file and does not execute anything on data in the file. No need for input if BEGIN action is only used
END {stop_action} : is performed after processing the file . Input data file is required
pattern/condition {action} : is performed while processing the file. Input data file is required

awk views a text file as records (lines) and fields(columns). each line is a record and each column within a line is a field
By default fields are seperated by spaces. The field seperator can be changed using the -F option.
Awk will work on each line individually and needs at least one action to run a script
It has its own predefined variables 
$0 - entire file
$1...$n - fields in each record
NR - record number (same as line number)
NF - number of fields in a line/record
FILENAME - name of file on which the awk command is currently executed againts

Examples
# cat /etc/passwd| head -2
root:x:0:0:root:/root:/bin/bash
daemon:x:1:1:daemon:/usr/sbin:/usr/sbin/nologin
# cat /etc/passwd | head -2 | awk -F ":" '{print $1}'
root
daemon
# cat /etc/passwd | head -2 | awk '{print $1}'
root:x:0:0:root:/root:/bin/bash
daemon:x:1:1:daemon:/usr/sbin:/usr/sbin/nologin
# cat /etc/passwd | head -2 | awk 'NR==2 {print $1}'
daemon:x:1:1:daemon:/usr/sbin:/usr/sbin/nologin
# awk '{print "ok","new"}' /etc/passwd| head -3         #QUOTATIONS are required for strings but not variables
ok new
ok new
ok new

# cat demo.txt
This is first line
This is second line
This is third line
# awk '{print $1,$3}' demo.txt
This first
This second
This third
# awk '{print $3,$1}' demo.txt
first This
second This
third This
# awk '{print NR,$1,$3}' demo.txt
1 This first
2 This second
3 This third


# cat demo.txt
This is first line 3939 330 kdkd
This is second line eeieie
This is third line 1 3 30 499 ajs ajsasb ajaaii
# awk '{print NF}' demo.txt
7
5
11
# awk '{print NR":"  NF}' demo.txt
1:7
2:5
3:11
# awk '{print "Line number is:",NR,"   Number of fields on this line is:"  NF}' demo.txt
Line number is: 1    Number of fields on this line is:7
Line number is: 2    Number of fields on this line is:5
Line number is: 3    Number of fields on this line is:11
# awk '{print $NF}' demo.txt                                prints the last field of each record(line)
kdkd
eeieie
ajaaii

# awk 'BEGIN {print "ok"}'                               #filename not required when BEGIN action is only used
ok
# awk 'BEGIN {print "ok"}' /etc/passwd                   #see no difference from above
ok

# awk 'BEGIN {print "=============Working on passwd file================"} /root/ {print $0} END {print "================Completed work on passwd file================"}' /etc/passwd
=============Working on passwd file================
root:x:0:0:root:/root:/bin/bash
================Completed work on passwd file================
# cat myawk.awk                                                                         #indenation or braces position does not matter in the myawk file
BEGIN {print "=============Working on passwd file================"}
/root/ {print $0}
END {print "================Completed work on passwd file================"}
# awk -f myawk.awk /etc/passwd
=============Working on passwd file================
root:x:0:0:root:/root:/bin/bash
================Completed work on passwd file================

field seperator in awk can be more than 1 character, this example uses a word, ec2
# echo "/home/vagrant/ec2-user" | awk -F "ec2" '{print $2}'         
-user
# echo "/home/vagrant/ec2-user" | awk -F "/" '{print $3}'
vagrant


Declaring and Using variables. Omit $ when referencing variables in awk, its not the same as shell script when $var is used
# echo "/home/vagrant/ec2-user" | awk -F "/" -v x=12 -v y=thanks '{print $3,y,x}'
vagrant thanks 12

How to run awk scripts
# which awk
/usr/bin/awk
-# cat awkscript.awk
#!/usr/bin/awk -f
BEGIN {print "Hello world"}
# chmod +x awkscript.awk
# ./awkscript.awk
Hello world
# awk -f awkscript.awk
Hello world

Initialize variable as best practice in a begin block(it can be initialized in other blocks). Multistatements are seperated by semicolons
# awk 'BEGIN {a=5;print a}'
5

Note that semicolon is not required in a script when multiple statements are on seperate lines. If they are on the same line use semicolon
root@lab1:~/awkscripts# cat simple.awk
#!/usr/bin/awk -f
BEGIN {
    a=5
    print a
}
root@lab1:~/awkscripts# ./simple.awk
5

Read variables from command line 
# cat ab.txt
2 6
# awk '{ a=$1 ; b=$2;print "a="a, "b="b}' ab.txt
a=2 b=6
# echo "2 6" | awk '{ a=$1;b=$2;print "a="a, "b="b}'
a=2 b=6
# cat ab.txt
2 6
3 10
# awk '{ a=$1;b=$2;print "a="a, "b="b}' ab.txt
a=2 b=6
a=3 b=10

Using a script to read variables from command line
-# cat display_a_b.awk
#!/usr/bin/awk -f
{
a=$1;b=$2
print "a="a, "b="b
}
# cat ab.txt
2 6
3 10
# ./display_a_b.awk ab.txt
a=2 b=6
a=3 b=10


How to Use awk command in shell script
# cat hi.awk
BEGIN {
	print "hi"
}

# cat demo.sh
#!/bin/bash
pwd
date
awk 'BEGIN {print "Hello from bash script"}'
awk -f hi.awk
# ./demo.sh
/root/awkscripts
Mon May  9 06:33:45 UTC 2022
Hello from bash script
hi

# cat demo.sh
a=$(awk 'BEGIN {print "Hello from bash script"}')
b=$(awk -f hi.awk)
echo "a value is: $a"
echo "b value is: $b"
# ./demo.sh
a value is: Hello from bash script
b value is: hi
# cat read_values.sh
read -p "Enter a value: " a
read -p "Enter b value: " b
echo "$a $b" | awk '{ x=$1; y=$2; print "x="x, "y="y}'
# bash read_values.sh
Enter a value: 3
Enter b value: 78
x=3 y=78

You can use bash and awk to perform arithmetic calculations with bc command. It also works with float
# cat read_values.sh
read -p "Enter a value: " a
read -p "Enter b value: " b
echo "$a $b" | awk '{ a=$1; b=$2; print "Division="a/b}'
# ./read_values.sh
Enter a value: 5
Enter b value: 2
Division=2.5

Another way to pass variables for calculation is using -v with BEGIN. BEGIN is required since no data file is passed to the awk command
# awk -v a=10 -v b=5 'BEGIN {print a/b}'
2
#!/usr/bin/env bash

<< help_test
https://www.cyberciti.biz/faq/comparing-numbers-in-bash-shell/
    File operators:
 
        -a FILE        True if file exists.
        -b FILE        True if file is block special.
        -c FILE        True if file is character special.
        -d FILE        True if file is a directory.
        -e FILE        True if file exists.
        -f FILE        True if file exists and is a regular file.
        -g FILE        True if file is set-group-id.
        -h FILE        True if file is a symbolic link.
        -L FILE        True if file is a symbolic link.
        -k FILE        True if file has its `sticky' bit set.
        -p FILE        True if file is a named pipe.
        -r FILE        True if file is readable by you.
        -s FILE        True if file exists and is not empty.
        -S FILE        True if file is a socket.
        -t FD          True if FD is opened on a terminal.
        -u FILE        True if the file is set-user-id.
        -w FILE        True if the file is writable by you.
        -x FILE        True if the file is executable by you.
        -O FILE        True if the file is effectively owned by you.
        -G FILE        True if the file is effectively owned by your group.
        -N FILE        True if the file has been modified since it was last read.
 
      FILE1 -nt FILE2  True if file1 is newer than file2 (according to
                       modification date).
 
      FILE1 -ot FILE2  True if file1 is older than file2.
 
      FILE1 -ef FILE2  True if file1 is a hard link to file2.
 
    String operators:
 
        -z STRING      True if string is empty.
 
        -n STRING
        STRING         True if string is not empty.
 
        STRING1 = STRING2
                       True if the strings are equal.
        STRING1 != STRING2
                       True if the strings are not equal.
        STRING1 < STRING2
                       True if STRING1 sorts before STRING2 lexicographically.
        STRING1 > STRING2
                       True if STRING1 sorts after STRING2 lexicographically.
 
    Other operators:
 
        -o OPTION      True if the shell option OPTION is enabled.
        ! EXPR         True if expr is false.
        EXPR1 -a EXPR2 True if both expr1 AND expr2 are true.
        EXPR1 -o EXPR2 True if either expr1 OR expr2 is true.
 
        arg1 OP arg2   Arithmetic tests.  OP is one of -eq, -ne,
                       -lt, -le, -gt, or -ge.
 
    Arithmetic binary operators return true if ARG1 is equal, not-equal,
    less-than, less-than-or-equal, greater-than, or greater-than-or-equal
    than ARG2.

help_test


#Difference between '=' and '==' operators in bash or sh
#https://stackoverflow.com/questions/12948456/is-there-any-difference-between-and-operators-in-bash-or-sh#:~:text=Inside%20single%20brackets%20for%20condition,in%20old%20or%20new%20shells.
: '
Comparison using = or == doesnt matter with [[ ]], but matters with [ ]
'

#Compare Numbers in Linux Shell Script
: '
https://www.linuxtechi.com/compare-numbers-strings-files-in-bash-script/
num1 -eq num2                  check if 1st  number is equal to 2nd number
num1 -ge num2                  checks if 1st  number  is greater than or equal to 2nd number
num1 -gt num2                  checks if 1st  number is greater than 2nd number
num1 -le num2                   checks if 1st number is less than or equal to 2nd number
num1 -lt num2                   checks if 1st  number  is less than 2nd number
num1 -ne num2                  checks if 1st  number  is not equal to 2nd number
'

#Compare Strings in Linux Shell Script
:'
https://www.linuxtechi.com/compare-numbers-strings-files-in-bash-script/
var1 = var2     checks if var1 is the same as string var2
var1 != var2    checks if var1 is not the same as var2
var1 < var2     checks if var1 is less than var2
var1 > var2     checks if var1 is greater than var2
-n var1             checks if var1 has a length greater than zero
-z var1             checks if var1 has a length of zero
'

#File comparison in Linux Shell Script
:'
-d file                        checks if the file exists and is it’s a directory
-e file                        checks if the file exists on system
-w file                        checks if the file exists on system and if it is writable
-r file                        checks if the file exists on system and it is readable
-s file                        checks if the file exists on system and it is not empty
-f file                        checks if the file exists on system and it is a file
-O file                        checks if the file exists on system and if it’s is owned by the current user
-G file                        checks if the file exists and the default group is the same as the current user
-x file                         checks if the file exists on system and is executable
file A -nt file B              checks if file A is newer than file B
file A -ot file B          checks if file A is older than file B
'
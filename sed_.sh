#sed syntax
sed [options] 'commands' data_filename
command | sed [options] commands 

Functions of sed: view file contents, searching, find and replace, insertion or deletion
Key notes: Use -n when using p(print) command and not d(delete) command. Use -i.back option when using delete command to backup the original file

#How sed works
Sed reads each line in a file, execute commands against them, displays the result on std out

VIEW FILE CONTENTS
# cat myfile.txt
Tomato
Lettuce
Capsicum
# sed '' myfile.txt                 #this functions exactly like cat command, same with the next 2 commands
Tomato
Lettuce
Capsicum
# sed -n 'p' myfile.txt                #Use -n to suppress the default print behaviour of sed and allow only p command to be used 
Tomato
Lettuce
Capsicum
# sed 'p' myfile.txt               #By default said will print all lines of file. Using the p(print) command will cause all lines to be printed twice
Tomato
Tomato
Lettuce
Lettuce
Capsicum
Capsicum


PRINT A PARTICULAR LINE
# cat file.txt
1 Tomato
2 Lettuce
3 Capsicum
4 the
5 is
6 here
7 radio
8 printer
9 tables
10 chair
# sed -n '2p' file.txt
2 Lettuce
# sed -n '9p' file.txt
9 tables
# sed -n '$p' file.txt                          #print last line of file
10 chair

PRINT A RANGE OF LINES
# sed -n '5,9p' file.txt
5 is
6 here
7 radio
8 printer
9 tables
# sed -n '7,$p' file.txt                        #print line 7 to last line
7 radio
8 printer
9 tables
10 chair
# sed -n '6,+2p' file.txt                        #print line 6 plus 2 lines
6 here  
7 radio
8 printer
# sed -n '1~3p' file.txt                           #Use tilde ~ to print in steps 
1 Tomato
4 the
7 radio
10 chair


DELETE line in a file. Note original file remains intact, result is displayed to screen
# sed '3d' file.txt                                         #print all lines except line 3. -n should not be used, use -n only with print option
1 Tomato
2 Lettuce
4 the
5 is
6 here
7 radio
8 printer
9 tables
10 chair
# sed '4,8d' file.txt                                   #print all lines except lines 4 to 8
1 Tomato
2 Lettuce
3 Capsicum
9 tables
10 chair
# sed '4,+2d' file.txt                      #delete lines 4 plus 2 more lines
1 Tomato
2 Lettuce
3 Capsicum
7 radio
8 printer
9 tables
10 chair

HOW TO EXECUTE INVERSE DELETE
# sed '2,3d' file.txt               #This will delete lines 2 and 3
1 Tomato
4 the
5 is
6 here
7 radio
8 printer
9 tables
10 chair
# sed '2,3!d' file.txt              #Using !d. This will delete all lines except line 2 and 3
2 Lettuce
3 Capsicum


# cat file_copy.txt
1 Tomato
2 Lettuce
3 Capsicum
4 the
5 is
6 here
7 radio
8 printer
9 tables
10 chair
# sed -i '3,8d' file_copy.txt                   #Will delete lines 3 to 8 within the file. FIle will be updated
# cat file_copy.txt
1 Tomato
2 Lettuce
9 tables
10 chair


# sed -n 'p' file_copy.txt
1 Tomato
2 Lettuce
3 Capsicum
4 the
5 is
6 here
7 radio
8 printer
9 tables
10 chair
# sed -i.back '3,8d' file_copy.txt                          #i.back create a backup file (file_copy.txt.back) before deleting the lines in the file
# ll file*
-rw-r--r-- 1 root root 38 May  9 21:47 file_copy.txt
-rw-r--r-- 1 root root 87 May  9 21:47 file_copy.txt.back
-rw-r--r-- 1 root root 87 May  9 21:16 file.txt
# cat file_copy.txt                                                 #lines 3 to 8 deleted in file
1 Tomato
2 Lettuce
9 tables
10 chair
# cat file_copy.txt.back                                                #backup file is same as original file
1 Tomato
2 Lettuce
3 Capsicum
4 the
5 is
6 here
7 radio
8 printer
9 tables
10 chair


SEARCHING A FILE
# sed -n '/radio/p' file.txt                                    #print lines containing radio
7 radio
# sed -n -e '/radio/p' -e '/the/p' file.txt                 #use -e to search for more than one word.
4 the
7 radio

When substituting a variable as a search string, use double quotes
# searchword=radio
# sed -n -e '/$searchword/p' file.txt          #using '' caused a search for the string $searchword instead of radio
# sed -n -e "/$searchword/p" file.txt           #using "" allows for variable substitution
7 radio

Search for line and delete it
# sed '/radio/d' file.txt               #Search for all lines containing radio and delete it
1 Tomato
2 Lettuce
3 Capsicum
4 the
5 is
6 here
8 printer
9 tables
10 chair
# sed '/radio/!d' file.txt                  #Search for all lines not containing radio and delete it
7 radio


FIND AND REPLACE: s/oldword/newword/ OR s/oldword/newword/g OR s/oldword/newword/2 OR /search/s/oldword/newword/g
#sed 's/root/udemy/' demo_passwd.txt             #This will search for root on each line and replace only the first occurence of root with udemy on each line
udemy:x:0:0:root:/root:/bin/bash
daemon:x:1:1:daemon:/usr/sbin:/usr/sbin/nologin
# sed 's/root/udemy/g' demo_passwd.txt            #replaces all occurence of root with udemy in the whole file
udemy:x:0:0:udemy:/udemy:/bin/bash
daemon:x:1:1:daemon:/usr/sbin:/usr/sbin/nologin
# sed 's/root/udemy/g' demo_passwd.txt
udemy:x:0:0:udemy:/udemy:/bin/bash
daemon:x:1:1:daemon:/usr/sbin:/usr/sbin/nologin
#sed 's/daemon/udemy/2' demo_passwd.txt                      #replaces only the second occurence of a daemon on each line with udemy
root:x:0:0:root:/root:/bin/bash
daemon:x:1:1:udemy:/usr/sbin:/usr/sbin/nologin
# sed '/daemon/s/nologin/LOGIN/' demo_passwd.txt            #search for lines containing daemon and replace first occurence of nologin with LOGIN in those lines
root:x:0:0:root:/root:/bin/bash
daemon:x:1:1:daemon:/usr/sbin:/usr/sbin/LOGIN
# sed '/daemon/s/nologin/LOGIN/g' demo_passwd.txt            #search for lines containing daemon and replace ALL occurence of nologin with LOGIN in those lines

INSERTION AND DELETION: 
SYNTAX: sed 'line_Numberi text_2_insert' file_copy.txt 
i-insert before a line : a-insert after a line
# cat file_copy.txt
1 Tomato
2 Lettuce
3 Capsicum
4 the
# sed '1i L_NO FRUIT' file_copy.txt                     #insert text before line 1
L_NO FRUIT
1 Tomato
2 Lettuce
3 Capsicum
4 the
# sed '1a ==================' file_copy.txt             #insert text after line 1
1 Tomato
==================
2 Lettuce
3 Capsicum
4 the
# sed '$a ==================' file_copy.txt             #insert text after last line 
1 Tomato
2 Lettuce
3 Capsicum
4 the
==================
# sed '/Lettuce/a ==================' file_copy.txt             #search for all lines containing Lettuce and insert text in a newline after
1 Tomato
2 Lettuce
==================
3 Capsicum
4 the
# sed '/Lettuce/i ==================' file_copy.txt             #search for all lines containing Lettuce and insert text in a newline before
1 Tomato
==================
2 Lettuce
3 Capsicum
4 the

SEARCH AND DELETE A LINE
# sed '' file_copy.txt
1 Tomato
2 Lettuce
3 Capsicum
4 the
# sed '/Lettuce/d' file_copy.txt            Search for lines containing lettuce and delete it
1 Tomato
3 Capsicum
4 the



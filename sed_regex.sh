() and {} need to be escaped as they have special meaning but not required for []
() used in function names 
{} display variables and function blocks

# cat ex.txt
This is a put
This is a pit
This is a pot
This \s is only a pyt
This is only pt
Thisisapot
Thiss
Thisss
Thissss
Thisssss
This is a line
This is a one more line
.    *    \+    \?
asdfasdfasdfasdfasdf
This	is	tab	line
# sed -n '/put/p' ex.txt
This is a put
# sed -n '/p[uo]t/p' ex.txt                 #search for put or pot
This is a put
This is a pot
Thisisapot

******************************************************************************************************************************************************
\s - match for spaces (it will include lines with tabs)
# sed -n '/\s/p' ex.txt
This is a put
This is a pit
This is a pot
This \s is only a pyt
This is only pt
Thiss
This is a line
This is a one more line
.    *    \+    \?
This    is      tab     line

******************************************************************************************************************************************************
\ - escape character 
# sed -n '/\\s/p' ex.txt            #Seacrch for literal \s using escape character
This \s is only a pyt

******************************************************************************************************************************************************
\t - tab space (will not include lines with spaces)
# sed -n '/\t/p' ex.txt
This	is	tab	line

******************************************************************************************************************************************************
. - match any character except newline
# sed -n '/p.t/p' ex.txt                    #pit,pot,pyt,put
This is a put
This is a pit
This is a pot
This \s is only a pyt
Thisisapot
# sed -n '/\sp.t/p' ex.txt              #will search for a word starting with space and exclude Thisisapot from previous example
This is a put
This is a pit
This is a pot
This \s is only a pyt

******************************************************************************************************************************************************
# cat ex.txt
This is a put asdf
This is a pitasdf
This is a pot asdf
This \s is only a pytasdf
This is only pt
Thisisapotasdf
Thiss
Thisss
Thissss
Thisssss
Thi is a line
This is a one more line
.    *    \+    \?
asdfasdfasdfasdfasdf
This	is	tab	line
# sed -n '/\sp.t\s/p' ex.txt
This is a put asdf
This is a pot asdf

******************************************************************************************************************************************************
* - match a sequence of zero or more instances of matches for the preceeding regular expression
# sed -n '/This/p' ex.txt           #includes words and substring patterns
This is a put asdf
This is a pitasdf
This is a pot asdf
This \s is only a pytasdf
This is only pt
Thisisapotasdf
Thiss
Thisss
Thissss
Thisssss
This is a one more line
This	is	tab	line
# sed -n '/This*/p' ex.txt                     #searches for Thi This Thiss Thisss Thissss
This is a put asdf
This is a pitasdf
This is a pot asdf
This \s is only a pytasdf
This is only pt
Thisisapotasdf
Thiss
Thisss
Thissss
Thisssss
Thi is a line
This is a one more line
This	is	tab	line

******************************************************************************************************************************************************
\+ - same as * but matches one or more
# sed -n '/This\+/p' ex.txt                     #searches for This  Thiss Thiss Thissss
This is a put asdf
This is a pitasdf
This is a pot asdf
This \s is only a pytasdf
This is only pt
Thisisapotasdf
Thiss
Thisss
Thissss
Thisssss
This is a one more line
This	is	tab	line

******************************************************************************************************************************************************
\? - same as * but matches zero or one
# sed -n '/This\?/p' ex.txt                 #searches for Thi or This as a word or substring
This is a put asdf
This is a pitasdf
This is a pot asdf
This \s is only a pytasdf
This is only pt
Thisisapotasdf
Thiss
Thisss
Thissss
Thisssss
Thi is a line
This is a one more line
This	is	tab	line
# sed -n '/This\?\s/p' ex.txt                 #searches for Thi or This as a word
This is a put asdf
This is a put asdf
This is a pitasdf
This is a pot asdf
This \s is only a pytasdf
This is only pt
Thi is a line
This is a one more line
This	is	tab	line

******************************************************************************************************************************************************
^ - line starting with a character(s). Use backslash \ to disable special characters
# cat ex.txt
This is a put asdf
put in this line
This is a pitasdf
This is a pot asdf
This \s is only a pytasdf
This is only pt
Thisisapotasdf pot
Thiss
Thisss

Thissss
Thisssss

Thi is a line
This is a one more line
.    *    \+    \?
asdfasdfasdfasdfasdf

This	is	tab	line
# sed -n '/put/p' ex.txt
This is a put asdf
put in this line
# sed -n '/^put/p' ex.txt
put in this line

******************************************************************************************************************************************************
$ - lines ending with a character(s). Use backslash \ to disable special characters
# sed -n '/pot/p' ex.txt
This is a pot asdf
Thisisapotasdf pot
# sed -n '/pot$/p' ex.txt
Thisisapotasdf pot

******************************************************************************************************************************************************
^$ - print empty lines
# sed -n '/^$/p' ex.txt                     #prints empty lines in a file



# sed '/^$/d' ex.txt                        #search for and delete empty lines
This is a put asdf
put in this line
This is a pitasdf
This is a pot asdf
This \s is only a pytasdf
This is only pt
Thisisapotasdf pot
Thiss
Thisss
Thissss
Thisssss
Thi is a line
This is a one more line
.    *    \+    \?
asdfasdfasdfasdfasdf
This	is	tab	line

******************************************************************************************************************************************************
[] - matches any single character in list
# cat ex.txt
This is a put asdf
put in this line
This is a pitasdf
This is a pot asdf
This \s is only a pytasdf
This is only pt
Thisisapotasdf pot
Thiss
Thisss

Thissss
Thisssss

Thi is a line
This is a one more line
.    *    \+    \?
asdfasdfasdfasdfasdf

This	is	tab	line
# sed -n '/p[uoy]t/p' ex.txt            #search for put,pyt or pot
This is a put asdf
put in this line
This is a pot asdf
This \s is only a pytasdf
Thisisapotasdf pot
# sed -n '/p[a-o]t/p' ex.txt            #search for a range from a-o
This is a pitasdf
This is a pot asdf
Thisisapotasdf pot
# sed -n '/p[a-ch-im-qx-z]t/p' ex.txt
This is a pitasdf
This is a pot asdf
This \s is only a pytasdf
Thisisapotasdf pot

******************************************************************************************************************************************************
{} - matches for required number of repeatitions of previous character. Use \{\} for  ''
# sed -n '/This\{3\}/p' ex.txt                  #searchs for 3 times but as a substring
Thisss
Thissss
Thisssss
# sed -n '/This\{3\}\b/p' ex.txt                 #searchs for 3 times but with a boundary or word
Thisss
# sed -n '/This\{3,4\}\b/p' ex.txt                 #searchs for 3 or 4 times but with a boundary or word
Thisss
Thissss
# sed -n '/This\{3,\}\b/p' ex.txt               #searchs for 3 or more times but with a boundary or word
Thisss
Thissss
Thisssss

******************************************************************************************************************************************************
() - search for zero or more whole sequence
# sed -n '/asdf\{2\}/p' ex.txt                          #asdff but we need asdfasdf
# sed -n '/\(asdf\)\{2\}/p' ex.txt                      #Searches for asdfasdf as a substring and use backslash for ( and )
asdfasdfasdfasdfasdf
# sed -n '/\(asdf\)\+/p' ex.txt                         #search for asdf at occuring at least once
This is a put asdf
This is a pitasdf
This is a pot asdf
This \s is only a pytasdf
Thisisapotasdf pot
asdfasdfasdfasdfasdf
# sed -n '/\b\(asdf\)\+\b/p' ex.txt
This is a put asdf
This is a pot asdf
asdfasdfasdfasdfasdf
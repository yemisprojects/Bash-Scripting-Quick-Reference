#Data is entered into the computer via stdin (usually the keyboard), and the resulting output goes to stdout (usually the shell). 
#These pathways are called streams. However, it's possible to alter these input and output locations, causing the computer to get information from somewhere other than stdin or send the results somewhere other than stdout. This functionality is referred to as redirection.

<< Streamredircetion
Commands with a single bracket overwrite the destination’s existing contents.
Overwrite
> - standard output
< - standard input
2> - standard error

Commands with a double bracket do not overwrite the destination’s existing contents.
Append
>> - standard output
<< - standard input
2>> - standard error
Streamredircetion

<<demo-redirect1
~/vagrant_boxes/trash$ cat mylist.txt
cat
dog
horse
cow
~/vagrant_boxes/trash$ sort < mylist.txt
cat
cow
dog
horse
~/vagrant_boxes/trash$ sort < mylist.txt > alphabetical-file.txt            #Redirect stdin from mylist.txt and send stdout to alphabetical-file.txt 
~/vagrant_boxes/trash$ cat alphabetical-file.txt
cat
cow
dog
horse
~/vagrant_boxes/trash$
demo-redirect1

#The stdout displays expected results. If errors appear, they are managed differently. Errors are labeled as file descriptor 2 (standard output is file descriptor 1). 
#When a program or script does not generate the expected results, it throws an error. The error is usually sent to the stdout, but it can be redirected elsewhere. 
#The stderr operator is 2> (for file descriptor 2).

#Note: /dev/null, or the bit bucket, is a special file used as a garbage can for the command line. Unwanted output can be redirected to this location to simply make it disappear.
<<demo-redirect2
~/vagrant_boxes/trash$ png
zsh: command not found: png
~/vagrant_boxes/trash$ png 2> /dev/null
~/vagrant_boxes/trash$
demo-redirect2


#Redirection Operators STDIN,STDOUT and STDERR. Note that some commands send success output to stderr such as `java -v``
<<redirect_demo
1>file1 redirects stdout(aka success) output to file1
2>file2 redirects stderr(aka error) output to file2

1>file1 2>file1 both stdout and stderr will redirect to same file1
1>file1 2>&1    both stdout and stderr  will redirect to same file1;MAKE SURE  2>&1 comes after 1>file1
&>file1         both stdout and stderr will redirect to same file1

cat < advanced-demo.sh     read a file by redirecting 
redirect_demo



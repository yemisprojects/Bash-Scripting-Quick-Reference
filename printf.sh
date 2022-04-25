#Good starting docs:
#https://linuxize.com/post/bash-printf-command/
#https://linuxhint.com/bash-printf-command/
#https://linuxconfig.org/bash-printf-syntax-basics-with-examples
# x=5
# echo $x 
# printf "$x\n"
# tput lines
# tput cols
# printf "%$(tput cols)s" " "| tr " " "-"

# x=5
# y=7.890
# title="shell scripting"

# # printf "integer=%d decimal=%f Course=%s \n"  "$x" "$y" "$title"         #substitutes decimal integer and string values via variables. Variables have to be in quotes

# # printf "%d\n" "$x"
# # printf "%5d\n" "$x"
# # printf "%05d\n" "$x"

# printf "%f\n" "$y"
# printf "%0.3f\n" "$y"
# printf "%20.3f\n" "$y"          #fill value in 20 positions, right align and 3 decimal places
# printf "%-20.3f\n" "$y"             #left align
# printf "%020.3f\n" "$y"             #fill value in 20 positions, right align and 3 decimal places. Fill remainin slots with 0

# printf "%s\n" "Hello Linuxhint" "Learn about" "Linux"

echo "Enter your name"
read name
echo "Enter your age"
read age
# printf  "Your name : %s\nYour age : %s\n" "$name" "$age"
printf  "Your name : %6s\nYour age : %10d\n" "$name" "$age"


# printf "\n" "%" 
# printf "%%\n" "%"

# printf "%c\n" "text"


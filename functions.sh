# Declaration of function
# function function_name()
# {
#     commands/statements
# }

# function_name()
# {
#     commands/statements
# }

# cat arguments_example.sh
#!/bin/bash
# Passing arguments to a function
print_something () {
echo Hello $1
}
print_something Mars
print_something Jupiter
# bash arguments_example.sh
Hello Mars
Hello Jupiter

Uisng return command to return a value from a function. Note it only applies to numbers, not strings
# cat return_status_example.sh
#!/bin/bash
# Setting a return status for a function
print_something () {
echo Hello $1
return 5
}
print_something Mars
print_something Jupiter
echo The previous function has a return value of $?
root@lab1:~/awkscripts# bash return_status_example.sh
Hello Mars
Hello Jupiter
The previous function has a return value of 5

Use Command Substitution is another way to return a result and have the function print the result (and only the result).
Use command substitution to take what would normally be printed to the screen and assign it to a variable
# cat myfile.txt
Tomato
Lettuce
Capsicum
# cat return_hack.sh
#!/bin/bash
# Setting a return value to a function
lines_in_file () {
cat $1 | wc -l
}
num_lines=$( lines_in_file $1 )
echo The file $1 has $num_lines lines in it.
# bash return_hack.sh myfile.txt
The file myfile.txt has 3 lines in it.


# cat maths_operators.sh
#!/bin/bash
read_input()
{
read -p "Enter first number: " num1
read -p "Enter second number: " num2
}

add_numbers()
{
sum=$((num1+num2))
echo "Addition of $num1 and $num2 is $sum"
}

subtraction()
{
sub=$((num1-num2))
echo "Subtraction of $num1 and $num2 is $sub"
}

read_input
add_numbers


# Declaration of function
# function function_name
# {
#     commands/statements
# }

# function_name()
# {
#     commands/statements
# }

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


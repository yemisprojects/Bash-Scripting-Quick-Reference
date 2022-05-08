# define_variable()
# {
#     local x=10
#     echo "$x"       #use echo to return a value or string
# }

# # define_variable
# # echo "value of x: $x"
# y=$(define_variable)        #use $() to capture return value from function
# echo "value of x: $y"


define_variable()
{
    local x=10
    #local x="shell"
    return $x       #this sets the exit status of the function to 10. It wont work for string values
}


define_variable
y=$?
echo "value of x: $y"
echo "$?"
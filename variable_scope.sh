#local keyword can only be used within a function and local variable cant be accessed outside of a function
#without local keyword all variables are global by default within or outside a function
display()
{
    echo "value of x in function is $x"
    x=67
    y=10
    local p=78
}

x=5
display
echo "value of x after calling display function is: $x"
echo "value of y outside display function is: $y"
echo "value of p outside display function is: $p"
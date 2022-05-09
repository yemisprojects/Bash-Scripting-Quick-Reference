#local keyword can only be used within a function and local variable cant be accessed outside of a function
#without local keyword all variables are global by default within or outside a function

By default a variable is global. This means that it is visible everywhere in the script. We may also create a variable as a local variable.
When we create a local variable within a function, it is only visible within that function. To do that we use the keyword local in front of the variable the first time we set it's value.: '
#Syntax
local var_name=<var_value>

#cat local_variable.sh
#!/bin/bash
# Experimenting with variable scope
var_change () {
    local var1='local 1'
    echo Inside function: var1 is $var1 : var2 is $var2
    var1='changed again'
    var2='2 changed again'
}
var1='global 1'
var2='global 2'
echo Before function call: var1 is $var1 : var2 is $var2
var_change
echo After function call: var1 is $var1 : var2 is $var2

# ./local_variables.sh
Before function call: var1 is global 1 : var2 is global 2
Inside function: var1 is local 1 : var2 is global 2
After function call: var1 is global 1 : var2 is 2 changed again

#BEST PRACTICE: Always use local variables within functions. Use global variables as a last resort and consider if there is a better way to do it before using them.

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
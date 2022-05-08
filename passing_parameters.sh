#Syntax pass parameter to function
#function_name $x $y

addition()
{
    m=$1        #use positional arguments to access the passed parameters in the function
    n=$2
    result=$((m+n))
    echo "The addition of $m and $n: $result"
    echo "Value of \$0 is:     $0" #note that $0 will always be the script name and not function name
}

x=4
y=5
addition $x $y 
addition 6 8
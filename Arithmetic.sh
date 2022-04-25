<<using_bc_command
Example – 4: Using ‘bc’ Command for Float or Double Numbers
One of the major limitations of the above ways of doing arithmetic operations in bash is that ‘expr’ or ‘let’ or double brackets expressions are not able to produce floating-point or double numbers.
using_bc_command

#!/bin/bash
# Basic arithmetic using let
let a=5+4               #Note that if we don't put quotes around the expression then it must be written with no spaces.
echo $a # 9
let "a = 5 + 4"
echo $a # 9
let a++
echo $a # 10
let "a = 4 * 5"
echo $a # 20
let "a = $1 + 30"
echo $a # 30 + first command line argument

<<goodlinks
https://linuxhint.com/bash_arithmetic_operations/
goodlinks

<<demo1
You have to use space with each operand when you want to use the ‘expr’ command to do any mathematical operations. It prints the output to commandline
#Using expr with backtick
myVal1=`expr 30 / 10`
echo $myVal1  

#Using expr within command substitute
myVal2=$( expr 30 - 10 )
echo $myVal2
demo1

<<demo2
double brackets can execute any mathematical expression with space or without space and you can also use increment/decrement and shorthand operators in double brackets expressions.

#!/bin/bash

# Calculate the mathematical expression
val1=$((10*5+15))
echo $val1

# Using post or pre increment/decrement operator
((val1++))
echo $val1
val2=41
((--val2))
echo $val2

# Using shorthand operator
(( val2 += 60 ))
echo $val2

# Dividing 40 by 6
(( val3 = 40/6 ))
echo $val3


demo2

#Note division only returns integers with no decimal
<<demo
~/vagrant_boxes/trash$ let a=5/3
~/vagrant_boxes/trash$ echo $a
1
~/vagrant_boxes/trash$

demo

<<operators
+, -, \*, /	addition, subtraction, multiply, divide
var++	Increase the variable var by 1
var--	Decrease the variable var by 1
%	Modulus (Return the remainder after division)
operators
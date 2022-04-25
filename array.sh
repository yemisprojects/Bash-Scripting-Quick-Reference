<<demo_array
#!/usr/bin/env bash

input=$@
newarray=$input
echo "command line input: $input"
echo "array: $newarray"


echo "Array values :"
#for val in ${newarray[@]}
for val in $@
do
printf "   %s\n" $val
done
demo_array


x=(3 5 6.7 "ls -lrt")           #array values should be seperated by spaces
#  echo ${x[@]}             #@ and * reads all values
# echo ${x[*]}
# echo ${x[2]}
# echo ${x[-1]}
# echo ${x[*]:1}
# echo ${x[*]:1:3}              #means read 3 values from indice 1 and not read indice 1 to indice 3
# echo ${!x[*]}                 #displays only indices numbers that have values
# echo ${#x[*]}                 #displays total number of itesm in the array

# newarray[3]=4                 #creates a new array with a value at indice 3
# newarray[5]=shell
# echo ${#newarray[@]}              
# echo ${!newarray[@]}              #display 3 5

# datearray=($(date))
# echo ${datearray[@]}
# echo ${datearray[2]}

# read -p "Enter you array: " -a array2             #reads input as array (uses -a option)
# echo ${array2[*]}

: '
#!/usr/bin/env bash

input=$@
newarray=$input
echo "command line input: $input"
echo "array: $newarray"


echo "Array values :"
#for val in ${newarray[@]}
for val in $@
do
printf "   %s\n" $val
done
'
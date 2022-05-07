# for each_file in $(ls); do
#     echo "$each_file"
# done


# for each_file in $(ls *.sh); do
#     echo "$each_file"
# done

# cnt=1
# for each_file in $(ls *.sh); do
#     if [[ $cnt -eq 1 ]]; then 
#         echo "$each_file"
#         ((cnt++))
#     fi 
# done

# #exit stops entire script while break exits only the for loop
# for each_file in $(ls *.sh); do
#         echo "$each_file"
#         break
# done


#continue ignores rest of command within the loop and goes back to begining of for command and continue the next iteration
for each in $(seq 1 10)
do
    if [[ $each -eq 5 ]]
    then
        continue
    fi
    echo "$each"
done
echo "end of for loop"



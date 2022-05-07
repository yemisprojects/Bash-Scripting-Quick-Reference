#!/usr/bin/env bash
# while true
# do 
#     echo "ok"
#     echo "-----------"
# done

# while :
# do 
#     echo "ok"
#     echo "-----------"
# done

# while date 1> /dev/null
# while date &> /dev/null
# do 
#     echo "ok"
#     echo "-----------"
# done

# while [[ 4 -gt 1 ]]
# do 
#     echo "Executing while loop"
#     echo "-----------"
# done

# start=1
# while [[ $start -le 10 ]]
# do
#     echo "$start"
#     ((start++))
# done

# $ cat servers_info.txt 
# 25.23.4.12 automation automation@123 date uptime
# 18.212.185.2 tomcat tomcat123 whoami date

# filename="servers_info.txt"
# while read each_line
# do
#     echo "$each_line"
# done < $filename


# filename="servers_info.txt"
# cat $filename | while read each_line
# do
#     echo $each_line
# done
#while loop syntax with IFS
# while IFS=":" read field1 field2 field3
# do
#     statements/commands
# done < file_name

# command | while IFS=":" read field1 field2 field3
# do
#     statements/commands
# done

# $ cat servers_info.txt 
# 25.23.4.12 automation automation@123 date uptime
# 18.212.185.2 tomcat tomcat123 whoami date

# while read line 
# do 
#    echo "$line"
# done < servers_info.txt

#the default internal field seperator is a space for a while loop
# while read field1 field2 field3
# do 
#    echo "$field1"
# done < servers_info.txt


# $ cat servers_info.txt 
# Server_IP,UserName,UserPassword,cmd1,cmd2
# 25.23.4.12,automation,automation@123,date,uptime
# 18.212.185.2,tomcat,tomcat123,whoami,date

#Using the file above, script below will return a blank output of 3 line
# while read field1 field2 field3
# do 
#    echo "$field2"
# done < servers_info.txt

#script below will print last 3 fields/column of the servers_info.txt file in each line
# while IFS="," read field1 field2 field3
# do 
#    echo "$field3"
# done < servers_info.txt

# cat servers_info.txt | awk 'NR!=1 {print}' | while IFS="," read field1 field2 field3 field4 field5
# do 
#    echo "$field1 $field2"
# done 

#Providing exact field variables corresponding to the input file allows each variable to capture each field in the file
#if fewer variables are provided, the last variable captures all the remaining fields in the file 
# cat servers_info.txt | awk 'NR!=1 {print}' | while IFS="," read field1 field2
# do 
#    echo "$field1            $field2"
# done 

# Its good practice to save old IFS variable and after change revert to the original value as shown below
# OLD_IFS=$IFS
# cat servers_info.txt | awk 'NR!=1 {print}' | while IFS="," read field1 field2
# do 
#    echo "$field1            $field2"
# done 
# IFS=$OLD_IFS
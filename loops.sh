# for eachvar in 1 2 3
# do
#     echo line$eachvar
# done

# <<demo
# if [[ $# -ne 1  ]]
# then
#     echo "Usage: $0 <dir_path>"
#     exit 1
# fi


# for eachfile in $(ls $1)
# do 
#     if [[ -x $eachfile ]]
#     then
#             echo "$eachfile has execute permission"
#     else
#             echo "$eachfile has no execute permission"
#     fi

# done
# demo

# for((cnt=1;cnt<=10;cnt++))
# do
#     echo "line $cnt"
# done

# <<demo1
# num=0
# for((;;))
# do
#     sleep 1
#     ((cnt++))
#     echo "infinite loop"
#     if test $cnt -eq 3
#     then
#             break
#     fi
# done
# demo1

# <<demo2
# if [[ $(id -u) -ne 0 ]]
# then
#         echo "please run as root or with sudo priviledge"
#         exit 1
# fi

# echo "you are root"

# if which nginx &> /dev/null
# then 
#      echo "nginx is already installed" 

# else
#     echo "Installing nginx..."
#     apt-get install nginx -y
#     echo "========================="

#     if [[ $? -eq 0 ]]
#     then
#         echo "nginx was successfully installed"
#     else
#         echo "nginx was not installed successfully"
#     fi
# fi
# demo2


# <<demos3
# if [[ $(id -u) -ne 0 ]]
# then
#         echo "please run as root or with sudo priviledge"
#         exit 1
# fi

# echo -e "you are root, Proceeding\n================="

# for each_pkg in nginx apache2
# do 

#     if which $each_pkg &> /dev/null
#     then 
#         echo "$each_pkg is already installed" 

#     else
#         echo -e "Installing $each_pkg...\n=================================="
#         apt-get install $each_pkg -y
#         echo "=================================="

#         if [[ $? -eq 0 ]]
#         then
#             echo "$each_pkg was successfully installed"
#         else
#             echo "$each_pkg was not installed successfully"
#         fi
#     fi

# done
# demos3 

# for each in $@
# do
#         echo "$each"
# done


if [[ $# -eq 0 ]]; then
    printf "Usage: $0 pkg1 pkg2 ... \n"
    exit 1
fi

if [[ $(id -u) -ne 0 ]]
then
        echo "please run as root or with sudo priviledge"
        exit 2
fi

echo -e "you are root, Proceeding\n================="

for each_pkg in $@
do 

    if which $each_pkg &> /dev/null
    then 
        echo "$each_pkg is already installed" 

    else
        echo -e "Installing $each_pkg...\n=================================="
        apt-get install $each_pkg -y
        echo "=================================="

        if [[ $? -eq 0 ]]
        then
            echo "$each_pkg was successfully installed"
        else
            echo "$each_pkg was not installed successfully"
        fi
    fi

done
 
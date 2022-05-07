
# echo "$@"
# echo "$*"
 
echo -e "Output for \$*\n============================"
#$* with quotes takes commandline input as single input vale
cnt=1
for each in "$*"
do  
        echo "$cnt"
        echo "$each"
        ((cnt++))
done

num=1
#$@ with quotes takes commandline inputs as seperrate values. Use $@ in most cases except when you need to treat multiple inputs as one entity
echo -e "Output for \$@\n============================"
for each in "$@"
do
        echo "$num times"
        echo "$each"
        ((num++))
done
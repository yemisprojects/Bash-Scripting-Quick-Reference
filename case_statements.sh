#syntax of case statements
#https://ryanstutorials.net/bash-scripting-tutorial/bash-if-statements.php#ifelif


case <variable> in
    <pattern 1>)
        <commands>
        ;;
    <pattern 2>)
        <other commands>
        ;;
esac

The end of the set of statements is identified with a double semi-colon ( ;; )
esac is case backwards and indicates we are at the end of the case statement.

# cat case.sh
#!/bin/bash
# case example
case $1 in
    start)
        echo starting
        ;;
    stop)
        echo stoping
        ;;
    restart)
        echo restarting
        ;;
    *)
        echo don\'t know
        ;;
esac
# bash case.sh stop
stoping
# bash case.sh
don't know

: '


# df -h
Filesystem                    Size  Used Avail Use% Mounted on
udev                          463M     0  463M   0% /dev
tmpfs                          99M  5.7M   93M   6% /run
/dev/mapper/vagrant--vg-root   62G  3.0G   56G   6% /
tmpfs                         493M     0  493M   0% /dev/shm
tmpfs                         5.0M     0  5.0M   0% /run/lock
tmpfs                         493M     0  493M   0% /sys/fs/cgroup
vagrant                       466G  282G  185G  61% /vagrant
tmpfs                          99M     0   99M   0% /run/user/1000
# cat diskusage.sh
#!/bin/bash
# Print a message about disk useage.
space_free=$( df -h | awk '{ print $5 }' | sort -n | tail -n 1 | sed 's/%//' )
case $space_free in
    [1-5]*)
        echo Plenty of disk space available
        ;;
    [6-7]*)
        echo There could be a problem in the near future
        ;;
    8*)
        echo Maybe we should look at clearing out old files
        ;;
    9*)
        echo We could have a serious problem on our hands soon
        ;;
    *)
        echo Something is not quite right here
        ;;
esac
# bash diskusage.sh
There could be a problem in the near future
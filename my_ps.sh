fmt="%-7s%-6s%-5s%-7s%-15s\n"

printf "$fmt" PID TTY STAT TIME COMMAND

for proc_dir in $(find /proc -maxdepth 1 -wholename '/proc/[0-9]*'); do

    if [ ! -f $proc_dir/stat ]; then
        continue
    fi

    # thanx to https://stackoverflow.com/a/56045866
    stat_array=( `sed -E 's/(\([^\s)]+)\s([^)]+\))/\1_\2/g' $proc_dir/stat` )

    pid=${stat_array[0]}
    
    state=${stat_array[2]}
    
    tty=${stat_array[6]}

    hertz=( `grep 'CONFIG_HZ=' /boot/config-$(uname -r) | cut -d '=' -f2` )
    utime=${stat_array[13]}
    stime=${stat_array[14]}
    total_time=$(( $utime + $stime ))
    seconds=$( awk 'BEGIN {print ( '$total_time' / '$hertz' )}' )

    command=$(tr '\0' ' ' < $proc_dir/cmdline)
    if [ -z "$command" ] 
    then
        command=[$(cat $proc_dir/comm)]
    fi

    printf "$fmt" $pid $tty $state $seconds "$command"
done

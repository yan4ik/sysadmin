make_raid6() {
    mdadm --create --verbose /dev/md0 -l 6 -n 5 /dev/sd[b-f]
}

save_raid() {
    echo "DEVICE partitions" > /etc/mdadm.conf
    mdadm --detail --scan --verbose | awk '/ARRAY/ {print}' >> /etc/mdadm.conf
}

make_raid6
save_raid

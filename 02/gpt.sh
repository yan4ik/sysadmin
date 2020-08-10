create_gpt_partitions() {
    parted -s /dev/md0 mklabel gpt
    
    parted /dev/md0 mkpart primary ext4 0% 20%
    parted /dev/md0 mkpart primary ext4 20% 40%
    parted /dev/md0 mkpart primary ext4 40% 60%
    parted /dev/md0 mkpart primary ext4 60% 80%
    parted /dev/md0 mkpart primary ext4 80% 100%
}

mount_fs() {
    for i in $(seq 1 5); do sudo mkfs.ext4 /dev/md0p$i; done

    mkdir -p /raid/part{1,2,3,4,5}
    for i in $(seq 1 5); do mount /dev/md0p$i /raid/part$i; done
}

save_mount() {
    cat /etc/mtab | fgrep /raid/part >> /etc/fstab
}

create_gpt_partitions
mount_fs
save_mount

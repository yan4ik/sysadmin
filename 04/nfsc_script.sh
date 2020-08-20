setup_nfs() {
    yum -y install nfs-utils
}

mount_nfs() {
    echo "192.168.50.10:/var/nfs_share /mnt nfs _netdev,rw,noatime,nodiratime,noauto,x-systemd.automount,nosuid,noexec,proto=udp,vers=3 0 0" >> /etc/fstab

    systemctl daemon-reload && systemctl restart remote-fs.target
}

setup_nfs
mount_nfs

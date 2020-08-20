setup_firewall() {
    systemctl enable firewalld.service
    systemctl start firewalld.service

    firewall-cmd --new-zone=nfs --permanent
    firewall-cmd --permanent --zone=nfs --add-service=nfs
    firewall-cmd --permanent --zone=nfs --add-port=2049/udp
    firewall-cmd --permanent --zone=nfs --add-service=rpc-bind
    firewall-cmd --permanent --zone=nfs --add-service=mountd
    firewall-cmd --permanent --zone=nfs --add-source=192.168.50.11
    firewall-cmd --reload
}

setup_nfs() {
    yum -y install nfs-utils
    
    systemctl enable nfs-server.service
    systemctl start nfs-server.service
}

export_dir() {
    mkdir /var/nfs_share
    mkdir /var/nfs_share/upload
    chown nfsnobody:nfsnobody -R /var/nfs_share/
    chmod 555 -R /var/nfs_share/
    chmod 777 -R /var/nfs_share/upload

    echo "/var/nfs_share 192.168.50.11(rw,sync,root_squash)" > /etc/exports
}

setup_firewall
export_dir
setup_nfs


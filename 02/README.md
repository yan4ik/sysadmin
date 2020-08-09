# ДЗ 2

Vagrantfile при создании провижнится двумя скриптами:
 * `raid.sh` - собирает RAID и прописывает конф для автосборки.
 * `gpt.sh` - создает раздел, партиции и монтирует их.

 ```sh
> vagrant up
...
> vagrant ssh
...
[vagrant@otuslinux ~]$ cat /proc/mdstat
Personalities : [raid6] [raid5] [raid4]
md0 : active raid6 sdf[4] sde[3] sdd[2] sdc[1] sdb[0]
      761856 blocks super 1.2 level 6, 512k chunk, algorithm 2 [5/5] [UUUUU]

unused devices: <none>
[vagrant@otuslinux ~]$ cat /etc/mdadm.conf
DEVICE partitions
ARRAY /dev/md0 level=raid6 num-devices=5 metadata=1.2 name=otuslinux:0 UUID=3cfbb5b4:63559d17:9006decf:4ff5327a
[vagrant@otuslinux ~]$ df -h
Filesystem      Size  Used Avail Use% Mounted on
devtmpfs        489M     0  489M   0% /dev
tmpfs           496M     0  496M   0% /dev/shm
tmpfs           496M  6.7M  489M   2% /run
tmpfs           496M     0  496M   0% /sys/fs/cgroup
/dev/sda1        40G  4.3G   36G  11% /
/dev/md0p1      139M  1.6M  127M   2% /raid/part1
/dev/md0p2      140M  1.6M  128M   2% /raid/part2
/dev/md0p3      142M  1.6M  130M   2% /raid/part3
/dev/md0p4      140M  1.6M  128M   2% /raid/part4
/dev/md0p5      139M  1.6M  127M   2% /raid/part5
tmpfs           100M     0  100M   0% /run/user/1000
```


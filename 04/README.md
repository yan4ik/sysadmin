# ДЗ 4

Скрипты:
 * `nfss_script.sh` - провижнит сервер.
 * `nfsc_script.sh` - провижнит клиент.

Фрагмент консоли клиента:
```ShellSession
> vagrant ssh nfsc
...
[vagrant@nfsc ~]$ sudo -i
[root@nfsc ~]# showmount -e 192.168.50.10
Export list for 192.168.50.10:
/var/nfs_share 192.168.50.11
[root@nfsc ~]# cd /mnt/
[root@nfsc mnt]# ls
upload
[root@nfsc mnt]# touch 1.txt
touch: cannot touch '1.txt': Permission denied
[root@nfsc mnt]# touch upload/1.txt && ls upload
1.txt
```

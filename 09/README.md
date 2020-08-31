# Управление процесссами

Сделал первый вариант - `ps ax` используя анализ `proc`.

Скрипт - `my_ps.sh`

```ShellSession
[root@lvm home]# ./my_ps.sh | head
PID    TTY   STAT TIME   COMMAND        
1      0     S    0.302  /usr/lib/systemd/systemd --switched-root --system --deserialize 22 
2      0     S    0.001  [kthreadd]     
3      0     S    0.103  [ksoftirqd/0]  
5      0     S    0      [kworker/0:0H] 
7      0     S    0      [migration/0]  
8      0     S    0      [rcu_bh]       
9      0     R    0.184  [rcu_sched]    
10     0     S    0      [lru-add-drain]
11     0     S    0.029  [watchdog/0]
```

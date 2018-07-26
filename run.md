执行方式
```shell
python /root/RdsBackup/rds_backup.py 2> /var/log/db_bak_all_error
```

当前测试存放目录结构
```shell
 /local/mntdir/dbbackup/
	- 18
	 - 07
		- 26
```

		
文件备份详情
```shell
[root@rbjr-web-007 dbbackup]# du -sh *
1.9G	rm-bp1n5hq57uvcd2e61_201807261336
[root@rbjr-web-007 dbbackup]# tar xvf rm-bp1n5hq57uvcd2e61_201807261336 
[root@rbjr-web-007 dbbackup]# du -sh *
[root@rbjr-web-007 dbbackup]# gunzip hscfdocs_datafull_201807261337_1807261337.sql.gz
```

备份文件压缩比
```shell
8.0K	hscfdocs_datafull_201807261337_1807261337.sql.gz
44K	hscfdocs_datafull_201807261337_1807261337.sql
```

定时任务
```shell
10 0,23 * * * python /root/RdsBackup/rds_backup.py 2> /var/log/db_bak_all_error
```

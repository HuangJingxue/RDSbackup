#### 环境安装：

```shell
wget "https://pypi.python.org/packages/source/p/pip/pip-1.5.4.tar.gz#md5=834b2904f92d46aaa333267fb1c922bb" --no-check-certificate
tar -xzvf pip-1.5.4.tar.gz
cd pip-1.5.4
python setup.py install

pip install requests
pip install aliyun-python-sdk-rds
```

#### 文件结构为：

```
RDSBackup/
  - rds_backup.py  #执行文件
  - config.py  #配置文件
  - backup.log  #备份日志
```

#### 配置文件详解：

```shell
#对RDS有操作权限的AK
access_key = 'xxx'
access_secret = 'xxx'

backup_dir = '/tmp'

clear = 1
backup_instances = []

a = {
        'DBInstanceId': 'xxx', #实例ID
        'Engine': 'MySQL',     #实例类型
        'BackupMethod': 'Logical', #备份类型
        'BackupDatabases': 'db'    #需要备份的库
    }

```

#### 备份文件解压缩：

```shell
[root@hjx02 tmp]# ll
-rw-r--r--. 1 root root 10240 7月  26 10:02 rm-bp14c1r9rhrzavel9_201807260958

[root@hjx02 tmp]# tar xvf rm-bp14c1r9rhrzavel9_201807260958 -C /rdsbackup
-rw-r--r--. 1 root root 872 7月  26 10:14 db_datafull_201807261013_1807261013.sql.gz

[root@hjx02 rdsbackup]# gunzip db_datafull_201807261013_1807261013.sql.gz 
-rw-r--r--. 1 root root 2213 7月  26 10:14 db_datafull_201807261013_1807261013.sql

```

#### 执行日志
```shell
[root@hjx02 RdsBackup]# python rds_backup.py 
rm-bp14c1r9rhrzavel9 Logical
{"RequestId":"64890143-8C91-4ECD-8362-E37ABA8594BE","BackupJobId":"4172159"}
等待中.
等待中.
等待中.
等待中.
等待中.
等待中.
等待中.
等待中.
等待中.
等待中.
等待中.
等待中.
等待中.
等待中.
等待中.
等待中.
等待中.
等待中.
等待中.
等待中.
等待中.
等待中.
等待中.
{u'HostInstanceID': 5101347, u'BackupLocation': u'OSS', u'StoreStatus': u'Disabled', u'BackupEndTime': u'2018-07-26T07:25:35Z', u'DBInstanceId': u'rm-bp14c1r9rhrzavel9', u'BackupMode': u'Manual', u'BackupDownloadURL': u'http://rdsbak-hzi-v2.oss-cn-hangzhou-i.aliyuncs.com/custins7573033/hins5101347_data_20180726152324.tar?OSSAccessKeyId=LTAITfQ7krsrEwRn&Expires=1532676422&Signature=BYsar6utWqPjwtIhKKSwQuE4KhY%3D', u'BackupType': u'FullBackup', u'BackupDBNames': u'db', u'BackupStartTime': u'2018-07-26T07:24:11Z', u'BackupIntranetDownloadURL': u'http://rdsbak-hzi-v2.oss-cn-hangzhou-internal.aliyuncs.com/custins7573033/hins5101347_data_20180726152324.tar?OSSAccessKeyId=LTAITfQ7krsrEwRn&Expires=1532676422&Signature=BYsar6utWqPjwtIhKKSwQuE4KhY%3D', u'BackupId': 257041132, u'BackupSize': 10240, u'BackupMethod': u'Logical', u'BackupStatus': u'Success', u'BackupScale': u'DBInstance'}
开始下载 rm-bp14c1r9rhrzavel9
0.00%
80.00%
100.00%
下载完成.
无失败任务， 所有任务已全部完成.
开始文件清理中。。。
过期文件已清理完毕：
共找到过期文件0个，清理成功0个：
```






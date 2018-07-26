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






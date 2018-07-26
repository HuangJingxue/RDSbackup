#!/bin/bash
start_time=`date --date='0 days ago' "+%Y-%m-%d %H:%M:%S"`
NOWTIME=`date +%Y"-"%m --date="0 day"`
YEAR=`date +%Y" "%m" "%d --date="0 day" | awk -F " " '{print $1}' |cut -c3-4`
MONTH=`date +%Y" "%m" "%d --date="0 day" | awk -F " " '{print $2}'`
DAY=`date +%Y" "%m" "%d --date="0 day" | awk -F " " '{print $3}'`
SQLBACKDIR="/local/mntdir/dbback/$YEAR/$MONTH/$DAY"
/root/ossutil cp -rf $SQLBACKDIR/ oss://tuidanbao/$NOWTIME
finish_time=`date --date='0 days ago' "+%Y-%m-%d %H:%M:%S"`
duration=$(($(($(date +%s -d "$finish_time")-$(date +%s -d "$start_time")))))
echo "this shell script execution duration: $duration s"

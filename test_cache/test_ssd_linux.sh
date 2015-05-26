#!/bin/sh
touch test_ssd_linux.log
uname -a >> test_ssd_linux.log
hdparm -i /dev/sdb >> test_ssd_linux.log
cat /sys/block/sdb/queue/scheduler >> test_ssd_linux.log
date >> test_ssd_linux.log
echo hdd:sdb >> test_ssd_linux.log
cat /sys/block/sdb/stat >> test_ssd_linux.log
fio --name=1sr128k --rw=read --filename=/dev/sdb --bs=128k --ioengine=libaio --iodepth=1 --size=8g --offset=1g --direct=1 --gtod_reduce=1 >> test_ssd_linux.log
echo hdd:sdb >> test_ssd_linux.log
cat /sys/block/sdb/stat >> test_ssd_linux.log
fio --name=1rr4k --rw=randread --filename=/dev/sdb --bs=4k --ioengine=libaio --iodepth=1 --filesize=9g --size=1g --offset=1g --direct=1 --gtod_reduce=1 >> test_ssd_linux.log
echo hdd:sdb >> test_ssd_linux.log
cat /sys/block/sdb/stat >> test_ssd_linux.log
fio --name=32rr4k --rw=randread --filename=/dev/sdb --bs=4k --ioengine=libaio --iodepth=32 --filesize=9g --size=4g --offset=1g --direct=1 --gtod_reduce=1 >> test_ssd_linux.log
echo hdd:sdb >> test_ssd_linux.log
cat /sys/block/sdb/stat >> test_ssd_linux.log
fio --name=1sw128k --rw=write --filename=/dev/sdb --bs=128k --ioengine=libaio --iodepth=1 --size=4g --offset=25g --direct=1 --gtod_reduce=1 >> test_ssd_linux.log
echo hdd:sdb >> test_ssd_linux.log
cat /sys/block/sdb/stat >> test_ssd_linux.log
fio --name=1sw128k --rw=write --filename=/dev/sdb --bs=128k --ioengine=libaio --iodepth=1 --size=64g --offset=29g --direct=1 --gtod_reduce=1 >> test_ssd_linux.log
echo hdd:sdb >> test_ssd_linux.log
cat /sys/block/sdb/stat >> test_ssd_linux.log
fio --name=32rrw8k --rw=randrw --rwmixread=67 --filename=/dev/sdb --bs=8k --ioengine=libaio --iodepth=32 --filesize=9g --size=4g --offset=1g --direct=1 --gtod_reduce=1 >> test_ssd_linux.log
echo hdd:sdb >> test_ssd_linux.log
cat /sys/block/sdb/stat >> test_ssd_linux.log
fio --name=1rw4k --rw=randwrite --filename=/dev/sdb --bs=4k --ioengine=libaio --iodepth=1 --filesize=17g --size=1g --offset=9g --direct=1 --gtod_reduce=1 >> test_ssd_linux.log
echo hdd:sdb >> test_ssd_linux.log
cat /sys/block/sdb/stat >> test_ssd_linux.log
fio --name=32rw4k --rw=randwrite --filename=/dev/sdb --bs=4k --ioengine=libaio --iodepth=32 --filesize=25g --size=4g --offset=17g --direct=1 --gtod_reduce=1 >> test_ssd_linux.log
echo hdd:sdb >> test_ssd_linux.log
cat /sys/block/sdb/stat >> test_ssd_linux.log
date >> test_ssd_linux.log

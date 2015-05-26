#!/bin/sh
touch test_flashcache.log
uname -a >> test_flashcache.log
hdparm -i /dev/sdc >> test_flashcache.log
hdparm -i /dev/sdb >> test_flashcache.log
fio --name=1rr4k --rw=randread --filename=/dev/sdb --bs=4k --ioengine=libaio --iodepth=1 --filesize=8g --size=1g --direct=1 --gtod_reduce=1 >> test_flashcache.log
free -m >> test_flashcache.log
modprobe flashcache
echo flashcache_create >> test_flashcache.log
flashcache_create -p back -b 4k ftest /dev/sdb /dev/sdc
sleep 10
flashcache_load /dev/sdb
sysctl -a | grep flash >> test_flashcache.log
free -m >> test_flashcache.log
date >> test_flashcache.log
echo ssd:sdb >> test_flashcache.log
cat /sys/block/sdb/stat >> test_flashcache.log
echo hdd:sdc >> test_flashcache.log
cat /sys/block/sdc/stat >> test_flashcache.log
dmsetup status ftest >> test_flashcache.log
dmsetup table ftest >> test_flashcache.log
fio --name=1sr128k --rw=read --filename=/dev/dm-0 --bs=128k --ioengine=libaio --iodepth=1 --size=8g --offset=1g --direct=1 --gtod_reduce=1 >> test_flashcache.log
echo ssd:sdb >> test_flashcache.log
cat /sys/block/sdb/stat >> test_flashcache.log
echo hdd:sdc >> test_flashcache.log
cat /sys/block/sdc/stat >> test_flashcache.log
dmsetup status ftest >> test_flashcache.log
dmsetup table ftest >> test_flashcache.log
fio --name=1sr128k --rw=read --filename=/dev/dm-0 --bs=128k --ioengine=libaio --iodepth=1 --size=8g --offset=1g --direct=1 --gtod_reduce=1 >> test_flashcache.log
echo ssd:sdb >> test_flashcache.log
cat /sys/block/sdb/stat >> test_flashcache.log
echo hdd:sdc >> test_flashcache.log
cat /sys/block/sdc/stat >> test_flashcache.log
dmsetup status ftest >> test_flashcache.log
dmsetup table ftest >> test_flashcache.log
fio --name=1sr128k --rw=read --filename=/dev/dm-0 --bs=128k --ioengine=libaio --iodepth=1 --size=8g --offset=1g --direct=1 --gtod_reduce=1 >> test_flashcache.log
echo ssd:sdb >> test_flashcache.log
cat /sys/block/sdb/stat >> test_flashcache.log
echo hdd:sdc >> test_flashcache.log
cat /sys/block/sdc/stat >> test_flashcache.log
dmsetup status ftest >> test_flashcache.log
dmsetup table ftest >> test_flashcache.log
fio --name=1rr4k --rw=randread --filename=/dev/dm-0 --bs=4k --ioengine=libaio --iodepth=1 --filesize=9g --size=1g --offset=1g --direct=1 --gtod_reduce=1 >> test_flashcache.log
echo ssd:sdb >> test_flashcache.log
cat /sys/block/sdb/stat >> test_flashcache.log
echo hdd:sdc >> test_flashcache.log
cat /sys/block/sdc/stat >> test_flashcache.log
dmsetup status ftest >> test_flashcache.log
dmsetup table ftest >> test_flashcache.log
fio --name=32rr4k --rw=randread --filename=/dev/dm-0 --bs=4k --ioengine=libaio --iodepth=32 --filesize=9g --size=4g --offset=1g --direct=1 --gtod_reduce=1 >> test_flashcache.log
echo ssd:sdb >> test_flashcache.log
cat /sys/block/sdb/stat >> test_flashcache.log
echo hdd:sdc >> test_flashcache.log
cat /sys/block/sdc/stat >> test_flashcache.log
dmsetup status ftest >> test_flashcache.log
dmsetup table ftest >> test_flashcache.log
fio --name=1sw128k --rw=write --filename=/dev/dm-0 --bs=128k --ioengine=libaio --iodepth=1 --size=4g --offset=25g --direct=1 --gtod_reduce=1 >> test_flashcache.log
echo ssd:sdb >> test_flashcache.log
cat /sys/block/sdb/stat >> test_flashcache.log
echo hdd:sdc >> test_flashcache.log
cat /sys/block/sdc/stat >> test_flashcache.log
dmsetup status ftest >> test_flashcache.log
dmsetup table ftest >> test_flashcache.log
fio --name=1sw128k --rw=write --filename=/dev/dm-0 --bs=128k --ioengine=libaio --iodepth=1 --size=64g --offset=29g --direct=1 --gtod_reduce=1 >> test_flashcache.log
echo ssd:sdb >> test_flashcache.log
cat /sys/block/sdb/stat >> test_flashcache.log
echo hdd:sdc >> test_flashcache.log
cat /sys/block/sdc/stat >> test_flashcache.log
dmsetup status ftest >> test_flashcache.log
dmsetup table ftest >> test_flashcache.log
fio --name=1sw128k --rw=write --filename=/dev/dm-0 --bs=128k --ioengine=libaio --iodepth=1 --size=64g --offset=93g --direct=1 --gtod_reduce=1 >> test_flashcache.log
echo ssd:sdb >> test_flashcache.log
cat /sys/block/sdb/stat >> test_flashcache.log
echo hdd:sdc >> test_flashcache.log
cat /sys/block/sdc/stat >> test_flashcache.log
dmsetup status ftest >> test_flashcache.log
dmsetup table ftest >> test_flashcache.log
fio --name=1sw128k --rw=write --filename=/dev/dm-0 --bs=128k --ioengine=libaio --iodepth=1 --size=64g --offset=157g --direct=1 --gtod_reduce=1 >> test_flashcache.log
echo ssd:sdb >> test_flashcache.log
cat /sys/block/sdb/stat >> test_flashcache.log
echo hdd:sdc >> test_flashcache.log
cat /sys/block/sdc/stat >> test_flashcache.log
dmsetup status ftest >> test_flashcache.log
dmsetup table ftest >> test_flashcache.log
fio --name=1sw128k --rw=write --filename=/dev/dm-0 --bs=128k --ioengine=libaio --iodepth=1 --size=64g --offset=221g --direct=1 --gtod_reduce=1 >> test_flashcache.log
echo ssd:sdb >> test_flashcache.log
cat /sys/block/sdb/stat >> test_flashcache.log
echo hdd:sdc >> test_flashcache.log
cat /sys/block/sdc/stat >> test_flashcache.log
dmsetup status ftest >> test_flashcache.log
dmsetup table ftest >> test_flashcache.log
fio --name=1sw128k --rw=write --filename=/dev/dm-0 --bs=128k --ioengine=libaio --iodepth=1 --size=64g --offset=285g --direct=1 --gtod_reduce=1 >> test_flashcache.log
echo ssd:sdb >> test_flashcache.log
cat /sys/block/sdb/stat >> test_flashcache.log
echo hdd:sdc >> test_flashcache.log
cat /sys/block/sdc/stat >> test_flashcache.log
dmsetup status ftest >> test_flashcache.log
dmsetup table ftest >> test_flashcache.log
fio --name=1sw128k --rw=write --filename=/dev/dm-0 --bs=128k --ioengine=libaio --iodepth=1 --size=64g --offset=349g --direct=1 --gtod_reduce=1 >> test_flashcache.log
echo ssd:sdb >> test_flashcache.log
cat /sys/block/sdb/stat >> test_flashcache.log
echo hdd:sdc >> test_flashcache.log
cat /sys/block/sdc/stat >> test_flashcache.log
dmsetup status ftest >> test_flashcache.log
dmsetup table ftest >> test_flashcache.log
fio --name=1sw128k --rw=write --filename=/dev/dm-0 --bs=128k --ioengine=libaio --iodepth=1 --size=64g --offset=413g --direct=1 --gtod_reduce=1 >> test_flashcache.log
echo ssd:sdb >> test_flashcache.log
cat /sys/block/sdb/stat >> test_flashcache.log
echo hdd:sdc >> test_flashcache.log
cat /sys/block/sdc/stat >> test_flashcache.log
dmsetup status ftest >> test_flashcache.log
dmsetup table ftest >> test_flashcache.log
fio --name=1sw128k --rw=write --filename=/dev/dm-0 --bs=128k --ioengine=libaio --iodepth=1 --size=64g --offset=477g --direct=1 --gtod_reduce=1 >> test_flashcache.log
echo ssd:sdb >> test_flashcache.log
cat /sys/block/sdb/stat >> test_flashcache.log
echo hdd:sdc >> test_flashcache.log
cat /sys/block/sdc/stat >> test_flashcache.log
dmsetup status ftest >> test_flashcache.log
dmsetup table ftest >> test_flashcache.log
fio --name=1sr128k --rw=read --filename=/dev/dm-0 --bs=128k --ioengine=libaio --iodepth=1 --size=8g --offset=1g --direct=1 --gtod_reduce=1 >> test_flashcache.log
echo ssd:sdb >> test_flashcache.log
cat /sys/block/sdb/stat >> test_flashcache.log
echo hdd:sdc >> test_flashcache.log
cat /sys/block/sdc/stat >> test_flashcache.log
dmsetup status ftest >> test_flashcache.log
dmsetup table ftest >> test_flashcache.log
fio --name=1sr128k --rw=read --filename=/dev/dm-0 --bs=128k --ioengine=libaio --iodepth=1 --size=8g --offset=1g --direct=1 --gtod_reduce=1 >> test_flashcache.log
echo ssd:sdb >> test_flashcache.log
cat /sys/block/sdb/stat >> test_flashcache.log
echo hdd:sdc >> test_flashcache.log
cat /sys/block/sdc/stat >> test_flashcache.log
dmsetup status ftest >> test_flashcache.log
dmsetup table ftest >> test_flashcache.log
fio --name=1sr128k --rw=read --filename=/dev/dm-0 --bs=128k --ioengine=libaio --iodepth=1 --size=8g --offset=1g --direct=1 --gtod_reduce=1 >> test_flashcache.log
echo ssd:sdb >> test_flashcache.log
cat /sys/block/sdb/stat >> test_flashcache.log
echo hdd:sdc >> test_flashcache.log
cat /sys/block/sdc/stat >> test_flashcache.log
dmsetup status ftest >> test_flashcache.log
dmsetup table ftest >> test_flashcache.log
fio --name=1rr4k --rw=randread --filename=/dev/dm-0 --bs=4k --ioengine=libaio --iodepth=1 --filesize=9g --size=1g --offset=1g --direct=1 --gtod_reduce=1 >> test_flashcache.log
echo ssd:sdb >> test_flashcache.log
cat /sys/block/sdb/stat >> test_flashcache.log
echo hdd:sdc >> test_flashcache.log
cat /sys/block/sdc/stat >> test_flashcache.log
dmsetup status ftest >> test_flashcache.log
dmsetup table ftest >> test_flashcache.log
fio --name=32rr4k --rw=randread --filename=/dev/dm-0 --bs=4k --ioengine=libaio --iodepth=32 --filesize=9g --size=4g --offset=1g --direct=1 --gtod_reduce=1 >> test_flashcache.log
echo ssd:sdb >> test_flashcache.log
cat /sys/block/sdb/stat >> test_flashcache.log
echo hdd:sdc >> test_flashcache.log
cat /sys/block/sdc/stat >> test_flashcache.log
dmsetup status ftest >> test_flashcache.log
dmsetup table ftest >> test_flashcache.log
fio --name=32rrw8k --rw=randrw --rwmixread=67 --filename=/dev/dm-0 --bs=8k --ioengine=libaio --iodepth=32 --filesize=9g --size=4g --offset=1g --direct=1 --gtod_reduce=1 >> test_flashcache.log
echo ssd:sdb >> test_flashcache.log
cat /sys/block/sdb/stat >> test_flashcache.log
echo hdd:sdc >> test_flashcache.log
cat /sys/block/sdc/stat >> test_flashcache.log
dmsetup status ftest >> test_flashcache.log
dmsetup table ftest >> test_flashcache.log
fio --name=1rw4k --rw=randwrite --filename=/dev/dm-0 --bs=4k --ioengine=libaio --iodepth=1 --filesize=17g --size=1g --offset=9g --direct=1 --gtod_reduce=1 >> test_flashcache.log
echo ssd:sdb >> test_flashcache.log
cat /sys/block/sdb/stat >> test_flashcache.log
echo hdd:sdc >> test_flashcache.log
cat /sys/block/sdc/stat >> test_flashcache.log
dmsetup status ftest >> test_flashcache.log
dmsetup table ftest >> test_flashcache.log
fio --name=32rw4k --rw=randwrite --filename=/dev/dm-0 --bs=4k --ioengine=libaio --iodepth=32 --filesize=25g --size=4g --offset=17g --direct=1 --gtod_reduce=1 >> test_flashcache.log
echo ssd:sdb >> test_flashcache.log
cat /sys/block/sdb/stat >> test_flashcache.log
echo hdd:sdc >> test_flashcache.log
cat /sys/block/sdc/stat >> test_flashcache.log
dmsetup status ftest >> test_flashcache.log
dmsetup table ftest >> test_flashcache.log
free -m >> test_flashcache.log
date >> test_flashcache.log

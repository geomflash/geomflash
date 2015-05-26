#!/bin/sh
touch test_fio
uname -a >> test_fio
hdparm -i /dev/sdc >> test_fio
hdparm -i /dev/sdb >> test_fio
fio --name=1rr4k --rw=randread --filename=/dev/sdb --bs=4k --ioengine=libaio --iodepth=1 --filesize=8g --size=1g --direct=1 --gtod_reduce=1 >> test_fio
free -m >> test_fio
echo create_dm-cache >> test_fio
dmsetup create cache-metadata --table '0 38720 linear /dev/sdb 0'
dd if=/dev/zero of=/dev/mapper/cache-metadata bs=4k count=1
dmsetup create cache-data --table '0 500079472 linear /dev/sdb 38720'
dmsetup create dmtest --table '0 7814037168 cache /dev/mapper/cache-metadata /dev/mapper/cache-data /dev/sdc 512 1 writeback default 0'
dmsetup message dmtest 0 migration_threshold 33554432
dmsetup message dmtest 0 sequential_threshold 2840207360
dmsetup message dmtest 0 read_promote_adjustment 2
dmsetup message dmtest 0 write_promote_adjustment 0
sleep 10
free -m >> test_fio
date >> test_fio
echo ssd:sdb >> test_fio
cat /sys/block/sdb/stat >> test_fio
cat /sys/block/dm-0/stat >> test_fio
cat /sys/block/dm-1/stat >> test_fio
echo hdd:sdc >> test_fio
cat /sys/block/sdc/stat >> test_fio
dmsetup status dmtest >> test_fio
fio --name=1sr128k --rw=read --filename=/dev/mapper/dmtest --bs=128k --ioengine=libaio --iodepth=1 --size=8g --offset=1g --direct=1 --gtod_reduce=1 >> test_fio
echo ssd:sdb >> test_fio
cat /sys/block/sdb/stat >> test_fio
cat /sys/block/dm-0/stat >> test_fio
cat /sys/block/dm-1/stat >> test_fio
echo hdd:sdc >> test_fio
cat /sys/block/sdc/stat >> test_fio
dmsetup status dmtest >> test_fio
fio --name=1sr128k --rw=read --filename=/dev/mapper/dmtest --bs=128k --ioengine=libaio --iodepth=1 --size=8g --offset=1g --direct=1 --gtod_reduce=1 >> test_fio
echo ssd:sdb >> test_fio
cat /sys/block/sdb/stat >> test_fio
cat /sys/block/dm-0/stat >> test_fio
cat /sys/block/dm-1/stat >> test_fio
echo hdd:sdc >> test_fio
cat /sys/block/sdc/stat >> test_fio
dmsetup status dmtest >> test_fio
fio --name=1sr128k --rw=read --filename=/dev/mapper/dmtest --bs=128k --ioengine=libaio --iodepth=1 --size=8g --offset=1g --direct=1 --gtod_reduce=1 >> test_fio
echo ssd:sdb >> test_fio
cat /sys/block/sdb/stat >> test_fio
cat /sys/block/dm-0/stat >> test_fio
cat /sys/block/dm-1/stat >> test_fio
echo hdd:sdc >> test_fio
cat /sys/block/sdc/stat >> test_fio
dmsetup status dmtest >> test_fio
fio --name=1rr4k --rw=randread --filename=/dev/mapper/dmtest --bs=4k --ioengine=libaio --iodepth=1 --filesize=9g --size=1g --offset=1g --direct=1 --gtod_reduce=1 >> test_fio
echo ssd:sdb >> test_fio
cat /sys/block/sdb/stat >> test_fio
cat /sys/block/dm-0/stat >> test_fio
cat /sys/block/dm-1/stat >> test_fio
echo hdd:sdc >> test_fio
cat /sys/block/sdc/stat >> test_fio
dmsetup status dmtest >> test_fio
fio --name=32rr4k --rw=randread --filename=/dev/mapper/dmtest --bs=4k --ioengine=libaio --iodepth=32 --filesize=9g --size=4g --offset=1g --direct=1 --gtod_reduce=1 >> test_fio
echo ssd:sdb >> test_fio
cat /sys/block/sdb/stat >> test_fio
cat /sys/block/dm-0/stat >> test_fio
cat /sys/block/dm-1/stat >> test_fio
echo hdd:sdc >> test_fio
cat /sys/block/sdc/stat >> test_fio
dmsetup status dmtest >> test_fio
fio --name=1sw128k --rw=write --filename=/dev/mapper/dmtest --bs=128k --ioengine=libaio --iodepth=1 --size=4g --offset=25g --direct=1 --gtod_reduce=1 >> test_fio
echo ssd:sdb >> test_fio
cat /sys/block/sdb/stat >> test_fio
cat /sys/block/dm-0/stat >> test_fio
cat /sys/block/dm-1/stat >> test_fio
echo hdd:sdc >> test_fio
cat /sys/block/sdc/stat >> test_fio
dmsetup status dmtest >> test_fio
fio --name=1sw128k --rw=write --filename=/dev/mapper/dmtest --bs=128k --ioengine=libaio --iodepth=1 --size=64g --offset=29g --direct=1 --gtod_reduce=1 >> test_fio
echo ssd:sdb >> test_fio
cat /sys/block/sdb/stat >> test_fio
cat /sys/block/dm-0/stat >> test_fio
cat /sys/block/dm-1/stat >> test_fio
echo hdd:sdc >> test_fio
cat /sys/block/sdc/stat >> test_fio
dmsetup status dmtest >> test_fio
fio --name=1sw128k --rw=write --filename=/dev/mapper/dmtest --bs=128k --ioengine=libaio --iodepth=1 --size=64g --offset=93g --direct=1 --gtod_reduce=1 >> test_fio
echo ssd:sdb >> test_fio
cat /sys/block/sdb/stat >> test_fio
cat /sys/block/dm-0/stat >> test_fio
cat /sys/block/dm-1/stat >> test_fio
echo hdd:sdc >> test_fio
cat /sys/block/sdc/stat >> test_fio
dmsetup status dmtest >> test_fio
fio --name=1sw128k --rw=write --filename=/dev/mapper/dmtest --bs=128k --ioengine=libaio --iodepth=1 --size=64g --offset=157g --direct=1 --gtod_reduce=1 >> test_fio
echo ssd:sdb >> test_fio
cat /sys/block/sdb/stat >> test_fio
cat /sys/block/dm-0/stat >> test_fio
cat /sys/block/dm-1/stat >> test_fio
echo hdd:sdc >> test_fio
cat /sys/block/sdc/stat >> test_fio
dmsetup status dmtest >> test_fio
fio --name=1sw128k --rw=write --filename=/dev/mapper/dmtest --bs=128k --ioengine=libaio --iodepth=1 --size=64g --offset=221g --direct=1 --gtod_reduce=1 >> test_fio
echo ssd:sdb >> test_fio
cat /sys/block/sdb/stat >> test_fio
cat /sys/block/dm-0/stat >> test_fio
cat /sys/block/dm-1/stat >> test_fio
echo hdd:sdc >> test_fio
cat /sys/block/sdc/stat >> test_fio
dmsetup status dmtest >> test_fio
fio --name=1sw128k --rw=write --filename=/dev/mapper/dmtest --bs=128k --ioengine=libaio --iodepth=1 --size=64g --offset=285g --direct=1 --gtod_reduce=1 >> test_fio
echo ssd:sdb >> test_fio
cat /sys/block/sdb/stat >> test_fio
cat /sys/block/dm-0/stat >> test_fio
cat /sys/block/dm-1/stat >> test_fio
echo hdd:sdc >> test_fio
cat /sys/block/sdc/stat >> test_fio
dmsetup status dmtest >> test_fio
fio --name=1sw128k --rw=write --filename=/dev/mapper/dmtest --bs=128k --ioengine=libaio --iodepth=1 --size=64g --offset=349g --direct=1 --gtod_reduce=1 >> test_fio
echo ssd:sdb >> test_fio
cat /sys/block/sdb/stat >> test_fio
cat /sys/block/dm-0/stat >> test_fio
cat /sys/block/dm-1/stat >> test_fio
echo hdd:sdc >> test_fio
cat /sys/block/sdc/stat >> test_fio
dmsetup status dmtest >> test_fio
fio --name=1sw128k --rw=write --filename=/dev/mapper/dmtest --bs=128k --ioengine=libaio --iodepth=1 --size=64g --offset=413g --direct=1 --gtod_reduce=1 >> test_fio
echo ssd:sdb >> test_fio
cat /sys/block/sdb/stat >> test_fio
cat /sys/block/dm-0/stat >> test_fio
cat /sys/block/dm-1/stat >> test_fio
echo hdd:sdc >> test_fio
cat /sys/block/sdc/stat >> test_fio
dmsetup status dmtest >> test_fio
fio --name=1sw128k --rw=write --filename=/dev/mapper/dmtest --bs=128k --ioengine=libaio --iodepth=1 --size=64g --offset=477g --direct=1 --gtod_reduce=1 >> test_fio
echo ssd:sdb >> test_fio
cat /sys/block/sdb/stat >> test_fio
cat /sys/block/dm-0/stat >> test_fio
cat /sys/block/dm-1/stat >> test_fio
echo hdd:sdc >> test_fio
cat /sys/block/sdc/stat >> test_fio
dmsetup status dmtest >> test_fio
fio --name=1sr128k --rw=read --filename=/dev/mapper/dmtest --bs=128k --ioengine=libaio --iodepth=1 --size=8g --offset=1g --direct=1 --gtod_reduce=1 >> test_fio
echo ssd:sdb >> test_fio
cat /sys/block/sdb/stat >> test_fio
cat /sys/block/dm-0/stat >> test_fio
cat /sys/block/dm-1/stat >> test_fio
echo hdd:sdc >> test_fio
cat /sys/block/sdc/stat >> test_fio
dmsetup status dmtest >> test_fio
fio --name=1sr128k --rw=read --filename=/dev/mapper/dmtest --bs=128k --ioengine=libaio --iodepth=1 --size=8g --offset=1g --direct=1 --gtod_reduce=1 >> test_fio
echo ssd:sdb >> test_fio
cat /sys/block/sdb/stat >> test_fio
cat /sys/block/dm-0/stat >> test_fio
cat /sys/block/dm-1/stat >> test_fio
echo hdd:sdc >> test_fio
cat /sys/block/sdc/stat >> test_fio
dmsetup status dmtest >> test_fio
fio --name=1sr128k --rw=read --filename=/dev/mapper/dmtest --bs=128k --ioengine=libaio --iodepth=1 --size=8g --offset=1g --direct=1 --gtod_reduce=1 >> test_fio
echo ssd:sdb >> test_fio
cat /sys/block/sdb/stat >> test_fio
cat /sys/block/dm-0/stat >> test_fio
cat /sys/block/dm-1/stat >> test_fio
echo hdd:sdc >> test_fio
cat /sys/block/sdc/stat >> test_fio
dmsetup status dmtest >> test_fio
fio --name=1rr4k --rw=randread --filename=/dev/mapper/dmtest --bs=4k --ioengine=libaio --iodepth=1 --filesize=9g --size=1g --offset=1g --direct=1 --gtod_reduce=1 >> test_fio
echo ssd:sdb >> test_fio
cat /sys/block/sdb/stat >> test_fio
cat /sys/block/dm-0/stat >> test_fio
cat /sys/block/dm-1/stat >> test_fio
echo hdd:sdc >> test_fio
cat /sys/block/sdc/stat >> test_fio
dmsetup status dmtest >> test_fio
fio --name=32rr4k --rw=randread --filename=/dev/mapper/dmtest --bs=4k --ioengine=libaio --iodepth=32 --filesize=9g --size=4g --offset=1g --direct=1 --gtod_reduce=1 >> test_fio
echo ssd:sdb >> test_fio
cat /sys/block/sdb/stat >> test_fio
cat /sys/block/dm-0/stat >> test_fio
cat /sys/block/dm-1/stat >> test_fio
echo hdd:sdc >> test_fio
cat /sys/block/sdc/stat >> test_fio
dmsetup status dmtest >> test_fio
fio --name=32rrw8k --rw=randrw --rwmixread=67 --filename=/dev/mapper/dmtest --bs=8k --ioengine=libaio --iodepth=32 --filesize=9g --size=4g --offset=1g --direct=1 --gtod_reduce=1 >> test_fio
echo ssd:sdb >> test_fio
cat /sys/block/sdb/stat >> test_fio
cat /sys/block/dm-0/stat >> test_fio
cat /sys/block/dm-1/stat >> test_fio
echo hdd:sdc >> test_fio
cat /sys/block/sdc/stat >> test_fio
dmsetup status dmtest >> test_fio
fio --name=1rw4k --rw=randwrite --filename=/dev/mapper/dmtest --bs=4k --ioengine=libaio --iodepth=1 --filesize=17g --size=1g --offset=9g --direct=1 --gtod_reduce=1 >> test_fio
echo ssd:sdb >> test_fio
cat /sys/block/sdb/stat >> test_fio
cat /sys/block/dm-0/stat >> test_fio
cat /sys/block/dm-1/stat >> test_fio
echo hdd:sdc >> test_fio
cat /sys/block/sdc/stat >> test_fio
dmsetup status dmtest >> test_fio
fio --name=32rw4k --rw=randwrite --filename=/dev/mapper/dmtest --bs=4k --ioengine=libaio --iodepth=32 --filesize=25g --size=4g --offset=17g --direct=1 --gtod_reduce=1 >> test_fio
echo ssd:sdb >> test_fio
cat /sys/block/sdb/stat >> test_fio
cat /sys/block/dm-0/stat >> test_fio
cat /sys/block/dm-1/stat >> test_fio
echo hdd:sdc >> test_fio
cat /sys/block/sdc/stat >> test_fio
dmsetup status dmtest >> test_fio
free -m >> test_fio
date >> test_fio

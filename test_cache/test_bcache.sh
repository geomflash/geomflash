#!/bin/sh
touch test_bcache.log
uname -a >> test_bcache.log
hdparm -i /dev/sdc >> test_bcache.log
hdparm -i /dev/sdb >> test_bcache.log
fio --name=1rr4k --rw=randread --filename=/dev/sdb --bs=4k --ioengine=libaio --iodepth=1 --filesize=8g --size=1g --direct=1 --gtod_reduce=1 >> test_bcache.log
free -m >> test_bcache.log
echo make-bcache >> test_bcache.log
make-bcache --block 4k --writeback --cset-uuid 633fa605-6b2d-4b49-93ff-e91f5e28229b -B /dev/sdc -C /dev/sdb
sleep 10
echo 633fa605-6b2d-4b49-93ff-e91f5e28229b > /sys/block/bcache0/bcache/attach
echo 0 > /sys/block/bcache0/bcache/sequential_cutoff
bcache-super-show /dev/sdb >> test_bcache.log
bcache-super-show /dev/sdc >> test_bcache.log
free -m >> test_bcache.log
date >> test_bcache.log
echo ssd:sdb >> test_bcache.log
cat /sys/block/sdb/stat >> test_bcache.log
echo hdd:sdc >> test_bcache.log
cat /sys/block/sdc/stat >> test_bcache.log
echo dirty_data >> test_bcache.log
cat /sys/block/bcache0/bcache/dirty_data >> test_bcache.log
echo cache_hit_ratio >> test_bcache.log
cat /sys/block/bcache0/bcache/stats_total/cache_hit_ratio >> test_bcache.log
fio --name=1sr128k --rw=read --filename=/dev/bcache0 --bs=128k --ioengine=libaio --iodepth=1 --size=8g --offset=1g --direct=1 --gtod_reduce=1 >> test_bcache.log
echo ssd:sdb >> test_bcache.log
cat /sys/block/sdb/stat >> test_bcache.log
echo hdd:sdc >> test_bcache.log
cat /sys/block/sdc/stat >> test_bcache.log
echo dirty_data >> test_bcache.log
cat /sys/block/bcache0/bcache/dirty_data >> test_bcache.log
echo cache_hit_ratio >> test_bcache.log
cat /sys/block/bcache0/bcache/stats_total/cache_hit_ratio >> test_bcache.log
fio --name=1sr128k --rw=read --filename=/dev/bcache0 --bs=128k --ioengine=libaio --iodepth=1 --size=8g --offset=1g --direct=1 --gtod_reduce=1 >> test_bcache.log
echo ssd:sdb >> test_bcache.log
cat /sys/block/sdb/stat >> test_bcache.log
echo hdd:sdc >> test_bcache.log
cat /sys/block/sdc/stat >> test_bcache.log
echo dirty_data >> test_bcache.log
cat /sys/block/bcache0/bcache/dirty_data >> test_bcache.log
echo cache_hit_ratio >> test_bcache.log
cat /sys/block/bcache0/bcache/stats_total/cache_hit_ratio >> test_bcache.log
fio --name=1sr128k --rw=read --filename=/dev/bcache0 --bs=128k --ioengine=libaio --iodepth=1 --size=8g --offset=1g --direct=1 --gtod_reduce=1 >> test_bcache.log
echo ssd:sdb >> test_bcache.log
cat /sys/block/sdb/stat >> test_bcache.log
echo hdd:sdc >> test_bcache.log
cat /sys/block/sdc/stat >> test_bcache.log
echo dirty_data >> test_bcache.log
cat /sys/block/bcache0/bcache/dirty_data >> test_bcache.log
echo cache_hit_ratio >> test_bcache.log
cat /sys/block/bcache0/bcache/stats_total/cache_hit_ratio >> test_bcache.log
fio --name=1rr4k --rw=randread --filename=/dev/bcache0 --bs=4k --ioengine=libaio --iodepth=1 --filesize=9g --size=1g --offset=1g --direct=1 --gtod_reduce=1 >> test_bcache.log
echo ssd:sdb >> test_bcache.log
cat /sys/block/sdb/stat >> test_bcache.log
echo hdd:sdc >> test_bcache.log
cat /sys/block/sdc/stat >> test_bcache.log
echo dirty_data >> test_bcache.log
cat /sys/block/bcache0/bcache/dirty_data >> test_bcache.log
echo cache_hit_ratio >> test_bcache.log
cat /sys/block/bcache0/bcache/stats_total/cache_hit_ratio >> test_bcache.log
fio --name=32rr4k --rw=randread --filename=/dev/bcache0 --bs=4k --ioengine=libaio --iodepth=32 --filesize=9g --size=4g --offset=1g --direct=1 --gtod_reduce=1 >> test_bcache.log
echo ssd:sdb >> test_bcache.log
cat /sys/block/sdb/stat >> test_bcache.log
echo hdd:sdc >> test_bcache.log
cat /sys/block/sdc/stat >> test_bcache.log
echo dirty_data >> test_bcache.log
cat /sys/block/bcache0/bcache/dirty_data >> test_bcache.log
echo cache_hit_ratio >> test_bcache.log
cat /sys/block/bcache0/bcache/stats_total/cache_hit_ratio >> test_bcache.log
fio --name=1sw128k --rw=write --filename=/dev/bcache0 --bs=128k --ioengine=libaio --iodepth=1 --size=4g --offset=25g --direct=1 --gtod_reduce=1 >> test_bcache.log
echo ssd:sdb >> test_bcache.log
cat /sys/block/sdb/stat >> test_bcache.log
echo hdd:sdc >> test_bcache.log
cat /sys/block/sdc/stat >> test_bcache.log
echo dirty_data >> test_bcache.log
cat /sys/block/bcache0/bcache/dirty_data >> test_bcache.log
echo cache_hit_ratio >> test_bcache.log
cat /sys/block/bcache0/bcache/stats_total/cache_hit_ratio >> test_bcache.log
fio --name=1sw128k --rw=write --filename=/dev/bcache0 --bs=128k --ioengine=libaio --iodepth=1 --size=64g --offset=29g --direct=1 --gtod_reduce=1 >> test_bcache.log
echo ssd:sdb >> test_bcache.log
cat /sys/block/sdb/stat >> test_bcache.log
echo hdd:sdc >> test_bcache.log
cat /sys/block/sdc/stat >> test_bcache.log
echo dirty_data >> test_bcache.log
cat /sys/block/bcache0/bcache/dirty_data >> test_bcache.log
echo cache_hit_ratio >> test_bcache.log
cat /sys/block/bcache0/bcache/stats_total/cache_hit_ratio >> test_bcache.log
fio --name=1sw128k --rw=write --filename=/dev/bcache0 --bs=128k --ioengine=libaio --iodepth=1 --size=64g --offset=93g --direct=1 --gtod_reduce=1 >> test_bcache.log
echo ssd:sdb >> test_bcache.log
cat /sys/block/sdb/stat >> test_bcache.log
echo hdd:sdc >> test_bcache.log
cat /sys/block/sdc/stat >> test_bcache.log
echo dirty_data >> test_bcache.log
cat /sys/block/bcache0/bcache/dirty_data >> test_bcache.log
echo cache_hit_ratio >> test_bcache.log
cat /sys/block/bcache0/bcache/stats_total/cache_hit_ratio >> test_bcache.log
fio --name=1sw128k --rw=write --filename=/dev/bcache0 --bs=128k --ioengine=libaio --iodepth=1 --size=64g --offset=157g --direct=1 --gtod_reduce=1 >> test_bcache.log
echo ssd:sdb >> test_bcache.log
cat /sys/block/sdb/stat >> test_bcache.log
echo hdd:sdc >> test_bcache.log
cat /sys/block/sdc/stat >> test_bcache.log
echo dirty_data >> test_bcache.log
cat /sys/block/bcache0/bcache/dirty_data >> test_bcache.log
echo cache_hit_ratio >> test_bcache.log
cat /sys/block/bcache0/bcache/stats_total/cache_hit_ratio >> test_bcache.log
fio --name=1sw128k --rw=write --filename=/dev/bcache0 --bs=128k --ioengine=libaio --iodepth=1 --size=64g --offset=221g --direct=1 --gtod_reduce=1 >> test_bcache.log
echo ssd:sdb >> test_bcache.log
cat /sys/block/sdb/stat >> test_bcache.log
echo hdd:sdc >> test_bcache.log
cat /sys/block/sdc/stat >> test_bcache.log
echo dirty_data >> test_bcache.log
cat /sys/block/bcache0/bcache/dirty_data >> test_bcache.log
echo cache_hit_ratio >> test_bcache.log
cat /sys/block/bcache0/bcache/stats_total/cache_hit_ratio >> test_bcache.log
fio --name=1sw128k --rw=write --filename=/dev/bcache0 --bs=128k --ioengine=libaio --iodepth=1 --size=64g --offset=285g --direct=1 --gtod_reduce=1 >> test_bcache.log
echo ssd:sdb >> test_bcache.log
cat /sys/block/sdb/stat >> test_bcache.log
echo hdd:sdc >> test_bcache.log
cat /sys/block/sdc/stat >> test_bcache.log
echo dirty_data >> test_bcache.log
cat /sys/block/bcache0/bcache/dirty_data >> test_bcache.log
echo cache_hit_ratio >> test_bcache.log
cat /sys/block/bcache0/bcache/stats_total/cache_hit_ratio >> test_bcache.log
fio --name=1sw128k --rw=write --filename=/dev/bcache0 --bs=128k --ioengine=libaio --iodepth=1 --size=64g --offset=349g --direct=1 --gtod_reduce=1 >> test_bcache.log
echo ssd:sdb >> test_bcache.log
cat /sys/block/sdb/stat >> test_bcache.log
echo hdd:sdc >> test_bcache.log
cat /sys/block/sdc/stat >> test_bcache.log
echo dirty_data >> test_bcache.log
cat /sys/block/bcache0/bcache/dirty_data >> test_bcache.log
echo cache_hit_ratio >> test_bcache.log
cat /sys/block/bcache0/bcache/stats_total/cache_hit_ratio >> test_bcache.log
fio --name=1sw128k --rw=write --filename=/dev/bcache0 --bs=128k --ioengine=libaio --iodepth=1 --size=64g --offset=413g --direct=1 --gtod_reduce=1 >> test_bcache.log
echo ssd:sdb >> test_bcache.log
cat /sys/block/sdb/stat >> test_bcache.log
echo hdd:sdc >> test_bcache.log
cat /sys/block/sdc/stat >> test_bcache.log
echo dirty_data >> test_bcache.log
cat /sys/block/bcache0/bcache/dirty_data >> test_bcache.log
echo cache_hit_ratio >> test_bcache.log
cat /sys/block/bcache0/bcache/stats_total/cache_hit_ratio >> test_bcache.log
fio --name=1sw128k --rw=write --filename=/dev/bcache0 --bs=128k --ioengine=libaio --iodepth=1 --size=64g --offset=477g --direct=1 --gtod_reduce=1 >> test_bcache.log
echo ssd:sdb >> test_bcache.log
cat /sys/block/sdb/stat >> test_bcache.log
echo hdd:sdc >> test_bcache.log
cat /sys/block/sdc/stat >> test_bcache.log
echo dirty_data >> test_bcache.log
cat /sys/block/bcache0/bcache/dirty_data >> test_bcache.log
echo cache_hit_ratio >> test_bcache.log
cat /sys/block/bcache0/bcache/stats_total/cache_hit_ratio >> test_bcache.log
fio --name=1sr128k --rw=read --filename=/dev/bcache0 --bs=128k --ioengine=libaio --iodepth=1 --size=8g --offset=1g --direct=1 --gtod_reduce=1 >> test_bcache.log
echo ssd:sdb >> test_bcache.log
cat /sys/block/sdb/stat >> test_bcache.log
echo hdd:sdc >> test_bcache.log
cat /sys/block/sdc/stat >> test_bcache.log
echo dirty_data >> test_bcache.log
cat /sys/block/bcache0/bcache/dirty_data >> test_bcache.log
echo cache_hit_ratio >> test_bcache.log
cat /sys/block/bcache0/bcache/stats_total/cache_hit_ratio >> test_bcache.log
fio --name=1sr128k --rw=read --filename=/dev/bcache0 --bs=128k --ioengine=libaio --iodepth=1 --size=8g --offset=1g --direct=1 --gtod_reduce=1 >> test_bcache.log
echo ssd:sdb >> test_bcache.log
cat /sys/block/sdb/stat >> test_bcache.log
echo hdd:sdc >> test_bcache.log
cat /sys/block/sdc/stat >> test_bcache.log
echo dirty_data >> test_bcache.log
cat /sys/block/bcache0/bcache/dirty_data >> test_bcache.log
echo cache_hit_ratio >> test_bcache.log
cat /sys/block/bcache0/bcache/stats_total/cache_hit_ratio >> test_bcache.log
fio --name=1sr128k --rw=read --filename=/dev/bcache0 --bs=128k --ioengine=libaio --iodepth=1 --size=8g --offset=1g --direct=1 --gtod_reduce=1 >> test_bcache.log
echo ssd:sdb >> test_bcache.log
cat /sys/block/sdb/stat >> test_bcache.log
echo hdd:sdc >> test_bcache.log
cat /sys/block/sdc/stat >> test_bcache.log
echo dirty_data >> test_bcache.log
cat /sys/block/bcache0/bcache/dirty_data >> test_bcache.log
echo cache_hit_ratio >> test_bcache.log
cat /sys/block/bcache0/bcache/stats_total/cache_hit_ratio >> test_bcache.log
fio --name=1rr4k --rw=randread --filename=/dev/bcache0 --bs=4k --ioengine=libaio --iodepth=1 --filesize=9g --size=1g --offset=1g --direct=1 --gtod_reduce=1 >> test_bcache.log
echo ssd:sdb >> test_bcache.log
cat /sys/block/sdb/stat >> test_bcache.log
echo hdd:sdc >> test_bcache.log
cat /sys/block/sdc/stat >> test_bcache.log
echo dirty_data >> test_bcache.log
cat /sys/block/bcache0/bcache/dirty_data >> test_bcache.log
echo cache_hit_ratio >> test_bcache.log
cat /sys/block/bcache0/bcache/stats_total/cache_hit_ratio >> test_bcache.log
fio --name=32rr4k --rw=randread --filename=/dev/bcache0 --bs=4k --ioengine=libaio --iodepth=32 --filesize=9g --size=4g --offset=1g --direct=1 --gtod_reduce=1 >> test_bcache.log
echo ssd:sdb >> test_bcache.log
cat /sys/block/sdb/stat >> test_bcache.log
echo hdd:sdc >> test_bcache.log
cat /sys/block/sdc/stat >> test_bcache.log
echo dirty_data >> test_bcache.log
cat /sys/block/bcache0/bcache/dirty_data >> test_bcache.log
echo cache_hit_ratio >> test_bcache.log
cat /sys/block/bcache0/bcache/stats_total/cache_hit_ratio >> test_bcache.log
fio --name=32rrw8k --rw=randrw --rwmixread=67 --filename=/dev/bcache0 --bs=8k --ioengine=libaio --iodepth=32 --filesize=9g --size=4g --offset=1g --direct=1 --gtod_reduce=1 >> test_bcache.log
echo ssd:sdb >> test_bcache.log
cat /sys/block/sdb/stat >> test_bcache.log
echo hdd:sdc >> test_bcache.log
cat /sys/block/sdc/stat >> test_bcache.log
echo dirty_data >> test_bcache.log
cat /sys/block/bcache0/bcache/dirty_data >> test_bcache.log
echo cache_hit_ratio >> test_bcache.log
cat /sys/block/bcache0/bcache/stats_total/cache_hit_ratio >> test_bcache.log
fio --name=1rw4k --rw=randwrite --filename=/dev/bcache0 --bs=4k --ioengine=libaio --iodepth=1 --filesize=17g --size=1g --offset=9g --direct=1 --gtod_reduce=1 >> test_bcache.log
echo ssd:sdb >> test_bcache.log
cat /sys/block/sdb/stat >> test_bcache.log
echo hdd:sdc >> test_bcache.log
cat /sys/block/sdc/stat >> test_bcache.log
echo dirty_data >> test_bcache.log
cat /sys/block/bcache0/bcache/dirty_data >> test_bcache.log
echo cache_hit_ratio >> test_bcache.log
cat /sys/block/bcache0/bcache/stats_total/cache_hit_ratio >> test_bcache.log
fio --name=32rw4k --rw=randwrite --filename=/dev/bcache0 --bs=4k --ioengine=libaio --iodepth=32 --filesize=25g --size=4g --offset=17g --direct=1 --gtod_reduce=1 >> test_bcache.log
echo ssd:sdb >> test_bcache.log
cat /sys/block/sdb/stat >> test_bcache.log
echo hdd:sdc >> test_bcache.log
cat /sys/block/sdc/stat >> test_bcache.log
echo dirty_data >> test_bcache.log
cat /sys/block/bcache0/bcache/dirty_data >> test_bcache.log
echo cache_hit_ratio >> test_bcache.log
cat /sys/block/bcache0/bcache/stats_total/cache_hit_ratio >> test_bcache.log
free -m >> test_bcache.log
date >> test_bcache.log

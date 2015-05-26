#!/bin/sh
touch test_fio_raid1_md
uname -a >> test_fio_raid1_md
hdparm -i /dev/sdc >> test_fio_raid1_md
hdparm -i /dev/sdd >> test_fio_raid1_md
mdadm --create /dev/md1 --level=1 --raid-device=2 --assume-clean --bitmap=none --metadata=0.90 /dev/sdc1 /dev/sdd1
sleep 5
cat /proc/mdstat >> test_fio_raid1_md
date >> test_fio_raid1_md
fio --name=1_1rw4k --rw=randwrite --filename=/dev/md1 --bs=4k --ioengine=libaio --iodepth=1 --filesize=3t --runtime=60 --direct=1 --gtod_reduce=1 >> test_fio_raid1_md
fio --name=2_1sw128k --rw=write --filename=/dev/md1 --bs=128k --ioengine=libaio --iodepth=1 --size=1t --offset=0 --direct=1 --gtod_reduce=1 >> test_fio_raid1_md
fio --name=3_1sw128k --rw=write --filename=/dev/md1 --bs=128k --ioengine=libaio --iodepth=1 --size=1t --offset=1t --direct=1 --gtod_reduce=1 >> test_fio_raid1_md
fio --name=4_1sw128k --rw=write --filename=/dev/md1 --bs=128k --ioengine=libaio --iodepth=1 --size=1t --offset=2t --direct=1 --gtod_reduce=1 >> test_fio_raid1_md
fio --name=5_1rw4k --rw=randwrite --filename=/dev/md1 --bs=4k --ioengine=libaio --iodepth=1 --filesize=3t --runtime=60 --direct=1 --gtod_reduce=1 >> test_fio_raid1_md
fio --name=6_1rr4k --rw=randread --filename=/dev/md1 --bs=4k --ioengine=libaio --iodepth=1 --filesize=3t --offset=10m --runtime=60 --direct=1 --gtod_reduce=1 >> test_fio_raid1_md
fio --name=7_2rr4k --rw=randread --filename=/dev/md1 --bs=4k --ioengine=libaio --iodepth=2 --filesize=3t --offset=11m --runtime=60 --direct=1 --gtod_reduce=1 >> test_fio_raid1_md
fio --name=8_3rr4k --rw=randread --filename=/dev/md1 --bs=4k --ioengine=libaio --iodepth=3 --filesize=3t --offset=12m --runtime=60 --direct=1 --gtod_reduce=1 >> test_fio_raid1_md
fio --name=9_4rr4k --rw=randread --filename=/dev/md1 --bs=4k --ioengine=libaio --iodepth=4 --filesize=3t --offset=13m --runtime=60 --direct=1 --gtod_reduce=1 >> test_fio_raid1_md
fio --name=10_6rr4k --rw=randread --filename=/dev/md1 --bs=4k --ioengine=libaio --iodepth=6 --filesize=3t --offset=14m --runtime=60 --direct=1 --gtod_reduce=1 >> test_fio_raid1_md
fio --name=11_8rr4k --rw=randread --filename=/dev/md1 --bs=4k --ioengine=libaio --iodepth=8 --filesize=3t --offset=15m --runtime=60 --direct=1 --gtod_reduce=1 >> test_fio_raid1_md
fio --name=12_12rr4k --rw=randread --filename=/dev/md1 --bs=4k --ioengine=libaio --iodepth=12 --filesize=3t --offset=16m --runtime=60 --direct=1 --gtod_reduce=1 >> test_fio_raid1_md
fio --name=13_16rr4k --rw=randread --filename=/dev/md1 --bs=4k --ioengine=libaio --iodepth=16 --filesize=3t --offset=17m --runtime=60 --direct=1 --gtod_reduce=1 >> test_fio_raid1_md
fio --name=14_24rr4k --rw=randread --filename=/dev/md1 --bs=4k --ioengine=libaio --iodepth=24 --filesize=3t --offset=18m --runtime=60 --direct=1 --gtod_reduce=1 >> test_fio_raid1_md
fio --name=15_32rr4k --rw=randread --filename=/dev/md1 --bs=4k --ioengine=libaio --iodepth=32 --filesize=3t --offset=19m --runtime=60 --direct=1 --gtod_reduce=1 >> test_fio_raid1_md
fio --name=16_32rrw8k --rw=randrw --rwmixread=67 --filename=/dev/md1 --bs=8k --ioengine=libaio --iodepth=32 --filesize=3t --offset=20m --runtime=60 --direct=1 --gtod_reduce=1 >> test_fio_raid1_md
fio --name=17_1sr128k --rw=read --filename=/dev/md1 --bs=128k --ioengine=libaio --iodepth=1 --size=8g --offset=32g --direct=1 --gtod_reduce=1 >> test_fio_raid1_md
fio 2sr >> test_fio_raid1_md
fio 3sr >> test_fio_raid1_md
fio 4sr >> test_fio_raid1_md
cat /proc/mdstat >> test_fio_raid1_md
mdadm --fail /dev/md1 /dev/sdd1
mdadm --remove /dev/md1 /dev/sdd1
sleep 1
cat /proc/mdstat >> test_fio_raid1_md
mdadm --add /dev/md1 /dev/sdd1
sleep 1
cat /proc/mdstat >> test_fio_raid1_md
cat /sys/block/md1/md/sync_speed_min >> test_fio_raid1_md
cat /sys/block/md1/md/sync_speed_max >> test_fio_raid1_md
fio --name=21_32rr4k --rw=randread --filename=/dev/md1 --bs=4k --ioengine=libaio --iodepth=32 --filesize=3t --offset=1m --runtime=60 --direct=1 --gtod_reduce=1 >> test_fio_raid1_md
sleep 3600
cat /proc/mdstat >> test_fio_raid1_md
fio --name=22_32rr4k --rw=randread --filename=/dev/md1 --bs=4k --ioengine=libaio --iodepth=32 --filesize=3t --offset=2m --runtime=60 --direct=1 --gtod_reduce=1 >> test_fio_raid1_md
sleep 3600
cat /proc/mdstat >> test_fio_raid1_md
fio --name=23_32rr4k --rw=randread --filename=/dev/md1 --bs=4k --ioengine=libaio --iodepth=32 --filesize=3t --offset=3m --runtime=60 --direct=1 --gtod_reduce=1 >> test_fio_raid1_md
sleep 3600
cat /proc/mdstat >> test_fio_raid1_md
fio --name=24_32rr4k --rw=randread --filename=/dev/md1 --bs=4k --ioengine=libaio --iodepth=32 --filesize=3t --offset=4m --runtime=60 --direct=1 --gtod_reduce=1 >> test_fio_raid1_md
sleep 3600
cat /proc/mdstat >> test_fio_raid1_md
fio --name=25_32rr4k --rw=randread --filename=/dev/md1 --bs=4k --ioengine=libaio --iodepth=32 --filesize=3t --offset=5m --runtime=60 --direct=1 --gtod_reduce=1 >> test_fio_raid1_md
sleep 3600
cat /proc/mdstat >> test_fio_raid1_md
fio --name=26_32rr4k --rw=randread --filename=/dev/md1 --bs=4k --ioengine=libaio --iodepth=32 --filesize=3t --offset=6m --runtime=60 --direct=1 --gtod_reduce=1 >> test_fio_raid1_md
sleep 3600
cat /proc/mdstat >> test_fio_raid1_md
fio --name=27_32rr4k --rw=randread --filename=/dev/md1 --bs=4k --ioengine=libaio --iodepth=32 --filesize=3t --offset=7m --runtime=60 --direct=1 --gtod_reduce=1 >> test_fio_raid1_md
sleep 3600
cat /proc/mdstat >> test_fio_raid1_md
fio --name=28_32rr4k --rw=randread --filename=/dev/md1 --bs=4k --ioengine=libaio --iodepth=32 --filesize=3t --offset=8m --runtime=20 --direct=1 --gtod_reduce=1 >> test_fio_raid1_md
sleep 3600
cat /proc/mdstat >> test_fio_raid1_md
fio --name=29_32rr4k --rw=randread --filename=/dev/md1 --bs=4k --ioengine=libaio --iodepth=32 --filesize=3t --offset=9m --runtime=20 --direct=1 --gtod_reduce=1 >> test_fio_raid1_md
date >> test_fio_raid1_md 
cat /proc/mdstat >> test_fio_raid1_md
mdadm --stop /dev/md1
sleep 2
mdadm --zero-superblock /dev/sdc1
mdadm --zero-superblock /dev/sdd1

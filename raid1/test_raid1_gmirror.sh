#!/bin/sh
touch test_raid1_gmirror.log
uname -a >> test_raid1_gmirror.log
geom disk list ada2 >> test_raid1_gmirror.log
geom disk list ada3 >> test_raid1_gmirror.log
gmirror label m0 ada2 ada3
gmirror load
sleep 5
gmirror list m0 >> test_raid1_gmirror.log
date >> test_raid1_gmirror.log
fio --name=1_1rw4k --rw=randwrite --filename=/dev/mirror/m0 --bs=4k --group_reporting --thread --numjobs=1 --filesize=3t --runtime=60 --direct=1 --gtod_reduce=1 >> test_raid1_gmirror.log
fio --name=2_1sw128k --rw=write --filename=/dev/mirror/m0 --bs=128k --group_reporting --thread --numjobs=1 --size=1t --offset=0 --direct=1 --gtod_reduce=1 >> test_raid1_gmirror.log
fio --name=3_1sw128k --rw=write --filename=/dev/mirror/m0 --bs=128k --group_reporting --thread --numjobs=1 --size=1t --offset=1t --direct=1 --gtod_reduce=1 >> test_raid1_gmirror.log
fio --name=4_1sw128k --rw=write --filename=/dev/mirror/m0 --bs=128k --group_reporting --thread --numjobs=1 --size=1t --offset=2t --direct=1 --gtod_reduce=1 >> test_raid1_gmirror.log
fio --name=5_1rw4k --rw=randwrite --filename=/dev/mirror/m0 --bs=4k --group_reporting --thread --numjobs=1 --filesize=3t --runtime=60 --direct=1 --gtod_reduce=1 >> test_raid1_gmirror.log
fio --name=6_1rr4k --rw=randread --filename=/dev/mirror/m0 --bs=4k --group_reporting --thread --numjobs=1 --filesize=3t --offset=10m --runtime=60 --direct=1 --gtod_reduce=1 >> test_raid1_gmirror.log
fio --name=7_2rr4k --rw=randread --filename=/dev/mirror/m0 --bs=4k --group_reporting --thread --numjobs=2 --filesize=3t --offset=11m --runtime=60 --direct=1 --gtod_reduce=1 >> test_raid1_gmirror.log
fio --name=8_3rr4k --rw=randread --filename=/dev/mirror/m0 --bs=4k --group_reporting --thread --numjobs=3 --filesize=3t --offset=12m --runtime=60 --direct=1 --gtod_reduce=1 >> test_raid1_gmirror.log
fio --name=9_4rr4k --rw=randread --filename=/dev/mirror/m0 --bs=4k --group_reporting --thread --numjobs=4 --filesize=3t --offset=13m --runtime=60 --direct=1 --gtod_reduce=1 >> test_raid1_gmirror.log
fio --name=10_6rr4k --rw=randread --filename=/dev/mirror/m0 --bs=4k --group_reporting --thread --numjobs=6 --filesize=3t --offset=14m --runtime=60 --direct=1 --gtod_reduce=1 >> test_raid1_gmirror.log
fio --name=11_8rr4k --rw=randread --filename=/dev/mirror/m0 --bs=4k --group_reporting --thread --numjobs=8 --filesize=3t --offset=15m --runtime=60 --direct=1 --gtod_reduce=1 >> test_raid1_gmirror.log
fio --name=12_12rr4k --rw=randread --filename=/dev/mirror/m0 --bs=4k --group_reporting --thread --numjobs=12 --filesize=3t --offset=16m --runtime=60 --direct=1 --gtod_reduce=1 >> test_raid1_gmirror.log
fio --name=13_16rr4k --rw=randread --filename=/dev/mirror/m0 --bs=4k --group_reporting --thread --numjobs=16 --filesize=3t --offset=17m --runtime=60 --direct=1 --gtod_reduce=1 >> test_raid1_gmirror.log
fio --name=14_24rr4k --rw=randread --filename=/dev/mirror/m0 --bs=4k --group_reporting --thread --numjobs=24 --filesize=3t --offset=18m --runtime=60 --direct=1 --gtod_reduce=1 >> test_raid1_gmirror.log
fio --name=15_32rr4k --rw=randread --filename=/dev/mirror/m0 --bs=4k --group_reporting --thread --numjobs=32 --filesize=3t --offset=19m --runtime=60 --direct=1 --gtod_reduce=1 >> test_raid1_gmirror.log
fio --name=16_32rrw8k --rw=randrw --rwmixread=67 --filename=/dev/mirror/m0 --bs=8k --group_reporting --thread --numjobs=32 --filesize=3t --offset=20m --runtime=60 --direct=1 --gtod_reduce=1 >> test_raid1_gmirror.log
fio --name=17_1sr128k --rw=read --filename=/dev/mirror/m0 --bs=128k --group_reporting --thread --numjobs=1 --size=8g --offset=32g --direct=1 --gtod_reduce=1 >> test_raid1_gmirror.log
fio 2sr >> test_raid1_gmirror.log
fio 3sr >> test_raid1_gmirror.log
fio 4sr >> test_raid1_gmirror.log
gmirror list m0 >> test_raid1_gmirror.log
gmirror remove m0 ada3
sleep 1
gmirror list m0 >> test_raid1_gmirror.log
gmirror insert m0 ada3
sleep 1
gmirror list m0 >> test_raid1_gmirror.log
fio --name=21_32rr4k --rw=randread --filename=/dev/mirror/m0 --bs=4k --group_reporting --thread --numjobs=32 --filesize=3t --offset=1m --runtime=60 --direct=1 --gtod_reduce=1 >> test_raid1_gmirror.log
sleep 3600
gmirror list m0 >> test_raid1_gmirror.log
fio --name=22_32rr4k --rw=randread --filename=/dev/mirror/m0 --bs=4k --group_reporting --thread --numjobs=32 --filesize=3t --offset=2m --runtime=60 --direct=1 --gtod_reduce=1 >> test_raid1_gmirror.log
sleep 3600
gmirror list m0 >> test_raid1_gmirror.log
fio --name=23_32rr4k --rw=randread --filename=/dev/mirror/m0 --bs=4k --group_reporting --thread --numjobs=32 --filesize=3t --offset=3m --runtime=60 --direct=1 --gtod_reduce=1 >> test_raid1_gmirror.log
sleep 3600
gmirror list m0 >> test_raid1_gmirror.log
fio --name=24_32rr4k --rw=randread --filename=/dev/mirror/m0 --bs=4k --group_reporting --thread --numjobs=32 --filesize=3t --offset=4m --runtime=60 --direct=1 --gtod_reduce=1 >> test_raid1_gmirror.log
sleep 3600
gmirror list m0 >> test_raid1_gmirror.log
fio --name=25_32rr4k --rw=randread --filename=/dev/mirror/m0 --bs=4k --group_reporting --thread --numjobs=32 --filesize=3t --offset=5m --runtime=60 --direct=1 --gtod_reduce=1 >> test_raid1_gmirror.log
sleep 3600
gmirror list m0 >> test_raid1_gmirror.log
fio --name=26_32rr4k --rw=randread --filename=/dev/mirror/m0 --bs=4k --group_reporting --thread --numjobs=32 --filesize=3t --offset=6m --runtime=60 --direct=1 --gtod_reduce=1 >> test_raid1_gmirror.log
sleep 3600
gmirror list m0 >> test_raid1_gmirror.log
fio --name=27_32rr4k --rw=randread --filename=/dev/mirror/m0 --bs=4k --group_reporting --thread --numjobs=32 --filesize=3t --offset=7m --runtime=60 --direct=1 --gtod_reduce=1 >> test_raid1_gmirror.log
sleep 3600
gmirror list m0 >> test_raid1_gmirror.log
fio --name=28_32rr4k --rw=randread --filename=/dev/mirror/m0 --bs=4k --group_reporting --thread --numjobs=32 --filesize=3t --offset=8m --runtime=20 --direct=1 --gtod_reduce=1 >> test_raid1_gmirror.log
sleep 3600
gmirror list m0 >> test_raid1_gmirror.log
fio --name=29_32rr4k --rw=randread --filename=/dev/mirror/m0 --bs=4k --group_reporting --thread --numjobs=32 --filesize=3t --offset=9m --runtime=20 --direct=1 --gtod_reduce=1 >> test_raid1_gmirror.log
date >> test_raid1_gmirror.log 
gmirror list m0 >> test_raid1_gmirror.log
gmirror destroy m0

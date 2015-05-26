#!/bin/sh
touch test_gflash.log
uname -a >> test_gflash.log
geom disk list ada2 >> test_gflash.log
geom disk list ada1 >> test_gflash.log
fio --name=1rr4k --rw=randread --filename=/dev/ada1 --bs=4k --group_reporting --thread --numjobs=1 --filesize=8g --size=1g --offset=1g --direct=1 --gtod_reduce=1 >> test_gflash.log
gflash create -r 4g -c ada1 f0 ada2
sleep 10
gflash list f0 >> test_gflash.log
vmstat -m | grep MemUse >> test_gflash.log
vmstat -m | grep gflash >> test_gflash.log
date >> test_gflash.log
iostat -xdI | grep d | grep -v ada0 >> test_gflash.log
fio --name=1sr128k --rw=read --filename=/dev/flash/f0 --bs=128k --group_reporting --thread --numjobs=1 --size=8g --offset=1g --direct=1 --gtod_reduce=1 >> test_gflash.log
gflash list f0 | fgrep ": ." >> test_gflash.log
iostat -xdI | grep d | grep -v ada0  >> test_gflash.log
fio --name=1sr128k --rw=read --filename=/dev/flash/f0 --bs=128k --group_reporting --thread --numjobs=1 --size=8g --offset=1g --direct=1 --gtod_reduce=1 >> test_gflash.log
gflash list f0 | fgrep ": ." >> test_gflash.log
iostat -xdI | grep d | grep -v ada0   >> test_gflash.log
fio --name=1sr128k --rw=read --filename=/dev/flash/f0 --bs=128k --group_reporting --thread --numjobs=1 --size=8g --offset=1g --direct=1 --gtod_reduce=1 >> test_gflash.log
gflash list f0 | fgrep ": ." >> test_gflash.log
iostat -xdI | grep d | grep -v ada0   >> test_gflash.log
fio --name=1rr4k --rw=randread --filename=/dev/flash/f0 --bs=4k --group_reporting --thread --numjobs=1 --filesize=9g --size=1g --offset=1g --direct=1 --gtod_reduce=1 >> test_gflash.log
gflash list f0 | fgrep ": ." >> test_gflash.log
iostat -xdI | grep d | grep -v ada0   >> test_gflash.log
fio --name=32rr4k --rw=randread --filename=/dev/flash/f0 --bs=4k --group_reporting --thread --numjobs=32 --filesize=9g --size=128m --offset=1g --direct=1 --gtod_reduce=1 >> test_gflash.log
gflash list f0 | fgrep ": ." >> test_gflash.log
iostat -xdI | grep d | grep -v ada0   >> test_gflash.log
fio --name=1sw128k --rw=write --filename=/dev/flash/f0 --bs=128k --group_reporting --thread --numjobs=1 --size=4g --offset=25g --direct=1 --gtod_reduce=1 >> test_gflash.log
gflash list f0 | fgrep ": ." >> test_gflash.log
iostat -xdI | grep d | grep -v ada0   >> test_gflash.log
fio --name=1sw128k --rw=write --filename=/dev/flash/f0 --bs=128k --group_reporting --thread --numjobs=1 --size=64g --offset=29g --direct=1 --gtod_reduce=1 >> test_gflash.log
gflash list f0 | fgrep ": ." >> test_gflash.log
iostat -xdI | grep d | grep -v ada0   >> test_gflash.log
fio --name=1sw128k --rw=write --filename=/dev/flash/f0 --bs=128k --group_reporting --thread --numjobs=1 --size=64g --offset=93g --direct=1 --gtod_reduce=1 >> test_gflash.log
gflash list f0 | fgrep ": ." >> test_gflash.log
iostat -xdI | grep d | grep -v ada0   >> test_gflash.log
fio --name=1sw128k --rw=write --filename=/dev/flash/f0 --bs=128k --group_reporting --thread --numjobs=1 --size=64g --offset=157g --direct=1 --gtod_reduce=1 >> test_gflash.log
gflash list f0 | fgrep ": ." >> test_gflash.log
iostat -xdI | grep d | grep -v ada0   >> test_gflash.log
fio --name=1sw128k --rw=write --filename=/dev/flash/f0 --bs=128k --group_reporting --thread --numjobs=1 --size=64g --offset=221g --direct=1 --gtod_reduce=1 >> test_gflash.log
gflash list f0 | fgrep ": ." >> test_gflash.log
iostat -xdI | grep d | grep -v ada0   >> test_gflash.log
fio --name=1sw128k --rw=write --filename=/dev/flash/f0 --bs=128k --group_reporting --thread --numjobs=1 --size=64g --offset=285g --direct=1 --gtod_reduce=1 >> test_gflash.log
gflash list f0 | fgrep ": ." >> test_gflash.log
iostat -xdI | grep d | grep -v ada0   >> test_gflash.log
fio --name=1sw128k --rw=write --filename=/dev/flash/f0 --bs=128k --group_reporting --thread --numjobs=1 --size=64g --offset=349g --direct=1 --gtod_reduce=1 >> test_gflash.log
gflash list f0 | fgrep ": ." >> test_gflash.log
iostat -xdI | grep d | grep -v ada0   >> test_gflash.log
fio --name=1sw128k --rw=write --filename=/dev/flash/f0 --bs=128k --group_reporting --thread --numjobs=1 --size=64g --offset=413g --direct=1 --gtod_reduce=1 >> test_gflash.log
gflash list f0 | fgrep ": ." >> test_gflash.log
iostat -xdI | grep d | grep -v ada0   >> test_gflash.log
fio --name=1sw128k --rw=write --filename=/dev/flash/f0 --bs=128k --group_reporting --thread --numjobs=1 --size=64g --offset=477g --direct=1 --gtod_reduce=1 >> test_gflash.log
gflash list f0 | fgrep ": ." >> test_gflash.log
iostat -xdI | grep d | grep -v ada0   >> test_gflash.log
fio --name=1sr128k --rw=read --filename=/dev/flash/f0 --bs=128k --group_reporting --thread --numjobs=1 --size=8g --offset=1g --direct=1 --gtod_reduce=1 >> test_gflash.log
gflash list f0 | fgrep ": ." >> test_gflash.log
iostat -xdI | grep d | grep -v ada0   >> test_gflash.log
fio --name=1sr128k --rw=read --filename=/dev/flash/f0 --bs=128k --group_reporting --thread --numjobs=1 --size=8g --offset=1g --direct=1 --gtod_reduce=1 >> test_gflash.log
gflash list f0 | fgrep ": ." >> test_gflash.log
iostat -xdI | grep d | grep -v ada0   >> test_gflash.log
fio --name=1sr128k --rw=read --filename=/dev/flash/f0 --bs=128k --group_reporting --thread --numjobs=1 --size=8g --offset=1g --direct=1 --gtod_reduce=1 >> test_gflash.log
gflash list f0 | fgrep ": ." >> test_gflash.log
iostat -xdI | grep d | grep -v ada0   >> test_gflash.log
fio --name=1rr4k --rw=randread --filename=/dev/flash/f0 --bs=4k --group_reporting --thread --numjobs=1 --filesize=9g --size=1g --offset=1g --direct=1 --gtod_reduce=1 >> test_gflash.log
gflash list f0 | fgrep ": ." >> test_gflash.log
iostat -xdI | grep d | grep -v ada0   >> test_gflash.log
fio --name=32rr4k --rw=randread --filename=/dev/flash/f0 --bs=4k --group_reporting --thread --numjobs=32 --filesize=9g --size=128m --offset=1g --direct=1 --gtod_reduce=1 >> test_gflash.log
gflash list f0 | fgrep ": ." >> test_gflash.log
iostat -xdI | grep d | grep -v ada0   >> test_gflash.log
fio --name=32rrw8k --rw=randrw --rwmixread=67 --filename=/dev/flash/f0 --bs=8k --group_reporting --thread --numjobs=32 --filesize=9g --size=128m --offset=1g --direct=1 --gtod_reduce=1 >> test_gflash.log
gflash list f0 | fgrep ": ." >> test_gflash.log
iostat -xdI | grep d | grep -v ada0   >> test_gflash.log
fio --name=1rw4k --rw=randwrite --filename=/dev/flash/f0 --bs=4k --group_reporting --thread --numjobs=1 --filesize=17g --size=1g --offset=9g --direct=1 --gtod_reduce=1 >> test_gflash.log
gflash list f0 | fgrep ": ." >> test_gflash.log
iostat -xdI | grep d | grep -v ada0   >> test_gflash.log
fio --name=32rw4k --rw=randwrite --filename=/dev/flash/f0 --bs=4k --group_reporting --thread --numjobs=32 --filesize=25g --size=128m --offset=17g --direct=1 --gtod_reduce=1 >> test_gflash.log
gflash list f0 | fgrep ": ." >> test_gflash.log
iostat -xdI | grep d | grep -v ada0   >> test_gflash.log
date >> test_gflash.log 

#! /bin/bash

for pvnum in `seq 1 10`; do
/tmp/1GBROMany.sh pv$pvnum $1;
done;

for pvnum in `seq 11 20`; do
/tmp/1GBRWMany.sh pv$pvnum $1;
done;

for pvnum in `seq 21 30`; do
/tmp/1GBRWOnce.sh pv$pvnum $1;
done;

for pvnum in `seq 31 40`; do
/tmp/5GBROMany.sh pv$pvnum $1;
done;

for pvnum in `seq 41 50`; do
/tmp/5GBRWMany.sh pv$pvnum $1;
done;

for pvnum in `seq 51 60`; do
/tmp/5GBRWOnce.sh pv$pvnum $1;
done;



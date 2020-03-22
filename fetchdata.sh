#!/bin/bash
cd ecdc
rm *.csv 2> /dev/null
for l in `cat ecdcdata.txt`; do
  while [ 1 ]; do
    wget -q --retry-connrefused --waitretry=1 --read-timeout=20 --timeout=15 -t 0 --continue "$l"
    if [ $? = 0 ]; then break; fi;
    sleep 1s;
  done;
done;
cd ..
cd who
rm *.csv 2> /dev/null
for l in `cat whodata.txt`; do
  while [ 1 ]; do
    wget -q --retry-connrefused --waitretry=1 --read-timeout=20 --timeout=15 -t 0 --continue "$l"
    if [ $? = 0 ]; then break; fi;
    sleep 1s;
  done;
done;
cd ..
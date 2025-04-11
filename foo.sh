#!/bin/bash

s=34

cd $1
for i in `find . -type f -name '*.jpg'`
do
  d=`echo $i | cut -d_ -f2`
  mkdir -p $d
  mv $i $d
done

for d in `find . -mindepth 1 -maxdepth 1 -type d | sed 's!^\./!!' | sort -n`;
do
  mv $d `printf '%03d' $s`
  s=$((s+1))
done

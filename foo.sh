#!/bin/bash

## @see [macOS 15.4.1 - date… - Apple コミュニティ](https://discussionsjapan.apple.com/thread/256047581?sortBy=rank)
LANG=C

s=52
sd=20250412

sut=`date -j -f "%Y%m%d" "$sd" "+%s"`

cd $1
for i in `find . -type f -name '*.jpg'`
do
  d=`echo $i | cut -d_ -f2`
  mkdir -p $d
  mv $i $d
done

for d in `find . -mindepth 1 -maxdepth 1 -type d | sed 's!^\./!!' | sort -n`;
do
  dut=`date "-v+${s}d" -j -f "%Y%m%d" $d "+%s"`
  dd=`printf '%03d' $(((dut - sut) / (60 * 60 * 24)))`
  mv $d $dd
done

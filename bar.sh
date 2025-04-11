#!/bin/bash

cd $1
for d in `find . -mindepth 1 -maxdepth 1 -type d`
do
  # echo $d
  cd $d
  c=0
  for i in `find . -type f -name '*.jpg'`
  do
    if [ $c -eq 0 ]; then
      # echo mv $i ${i/PXL/bb}
      mv $i ${i/PXL/bb}
    else
      n=`printf '%02d\n' $((c-1))`
      # echo mv $i ${i/PXL/$n}
      mv $i ${i/PXL/$n}
    fi

    # echo $c $i
    c=$((c+1))
  done
  cd ..
done

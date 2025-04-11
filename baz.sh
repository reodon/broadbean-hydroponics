#!/bin/bash

_days=`echo {17..50}`
days=
for d in $_days
do
  if [ $d -eq 33 ] || [ 1 -ne 1 ]; then
    :
  else
    days="${days} ${d}"
  fi
done


for d in $days
do
  echo
  echo "# ${d}日目"

  for i in `find images/0$d -type f | sort | sed -n '${p;x;p;q;}; H'`
  do
    if echo $i | grep bb >/dev/null 2>&1; then
      di=`basename $i .jpg`
      # di=${di:3:-3}
      di=${di#bb_}
      di=${di%???}
      date -j -v+9H -f '%Y%m%d_%H%M%S' "$di" '+%Y/%m/%d %R ごろ'
      echo "![ソラマメの様子${d}日目]($i)"
    else
      echo "<!-- ![]($i) -->"
    fi
  done
done

#!/bin/bash

# echo $1
_days=`ls images | sort`
nr=`echo "$_days" | cat | sed -n "/${1}/="`
# echo $nr
days=`echo "$_days" | tail -n "+${nr}"`

for d in $days
do
  df=${d#0}
  echo
  echo "# ${df}日目"

  for i in `find images/$d -type f | sort | sed -n '${p;x;p;q;}; H'`
  do
    if echo $i | grep bb >/dev/null 2>&1; then
      di=`basename $i .jpg`
      # di=${di:3:-3}
      di=${di#bb_}
      di=${di%???}
      date -j -v+9H -f '%Y%m%d_%H%M%S' "$di" '+%Y/%m/%d %R ごろ'
      echo "![ソラマメの様子${df}日目]($i)"
    else
      echo "<!-- ![]($i) -->"
    fi
  done
done

#!/bin/bash
start=$1
finish=$2
for((i=$start; i<=$finish; i++)) do
if [ -d "Shop$i" ]
then
  echo "Yes"
  cp "./Shop$i/in.txt" "./Analyses/store${i}_in.txt"
  cp "./Shop$i/out.txt" "./Analyses/store${i}_out.txt"
  cp "./Shop$i/price.txt" "./Analyses/store${i}_price.txt"
else
  echo "No such directory"
fi
done
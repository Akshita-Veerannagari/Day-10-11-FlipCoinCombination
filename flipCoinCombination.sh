#! /bin/bash

declare -A coinFlips
coinFlips["heads"]=0
coinFlips["tails"]=0
for(( counter=1; counter<=10; counter++ ))
do
	num=$(( RANDOM ))
	if [ $(( num % 2)) -eq 0 ]
	then
	        coinFlips["heads"]=$(( ${coinFlips[heads]}+1 ))
	else
	        coinFlips["tails"]=$(( ${coinFlips[tails]}+1 ))
	fi
done

for index in ${!coinFlips[@]}
do
	echo "$index: ${coinFlips[$index]}"
done

percentage_head=`echo ${coinFlips["heads"]} 10 100 | awk '{print ($1/$2)*$3}'`
percentage_tail=`echo ${coinFlips["tails"]} 10 100 | awk '{print ($1/$2)*$3}'`

echo "Percentage of occurence of heads is $percentage_head"
echo "Percentage of occurence of tails is $percentage_tail"

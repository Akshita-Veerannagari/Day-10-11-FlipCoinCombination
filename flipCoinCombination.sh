#! /bin/bash

declare -A coinFlips
coinFlips["HH"]=0
coinFlips["HT"]=0
coinFlips["TH"]=0
coinFlips["TT"]=0

for(( counter=1; counter<=10; counter++ ))
do
	num1=$(( RANDOM ))
	num2=$(( RANDOM ))
	if [ $(( num1 % 2)) -eq 0  -a $(( num2%2 )) -eq 0 ]
	then
	        coinFlips["HH"]=$(( ${coinFlips[HH]}+1 ))
	elif [ $(( num1%2 )) -eq 0 -a $(( num2%2 )) -eq 1 ]
	then
		coinFlips["HT"]=$(( ${coinFlips[HT]}+1 ))
	elif [ $(( num1%2 )) -eq 1 -a $(( num2%2 )) -eq 0 ]
	then
		coinFlips["TH"]=$(( ${coinFlips[TH]}+1 ))
	else
	        coinFlips["TT"]=$(( ${coinFlips[TT]}+1 ))
	fi
done

for index in ${!coinFlips[@]}
do
	echo "$index: ${coinFlips[$index]}"
done

percentage_HH=`echo ${coinFlips["HH"]} 10 100 | awk '{print ($1/$2)*$3}'`
percentage_TT=`echo ${coinFlips["TT"]} 10 100 | awk '{print ($1/$2)*$3}'`
percentage_HT=`echo ${coinFlips["HT"]} 10 100 | awk '{print ($1/$2)*$3}'`
percentage_TH=`echo ${coinFlips["TH"]} 10 100 | awk '{print ($1/$2)*$3}'`

echo "Percentage of occurence of HH is $percentage_HH"
echo "Percentage of occurence of HT is $percentage_HT"
echo "Percentage of occurence of TH is $percentage_TH"
echo "Percentage of occurence of TT is $percentage_TT"

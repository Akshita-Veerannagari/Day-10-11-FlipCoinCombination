#! /bin/bash

declare -A coinFlipsSingle
declare -A coinFlipsDouble

function singlet()
{
        coinFlipsSingle["heads"]=0
        coinFlipsSingle["tails"]=0
        for(( counter=1; counter<=10; counter++ ))
        do
                num=$(( RANDOM ))
                if [ $(( num % 2)) -eq 0 ]
                then
                        coinFlipsSingle["heads"]=$(( ${coinFlipsSingle[heads]}+1 ))
                else
                        coinFlipsSingle["tails"]=$(( ${coinFlipsSingle[tails]}+1 ))
                fi
        done

        for index in ${!coinFlipsSingle[@]}
        do
                echo "$index: ${coinFlipsSingle[$index]}"
        done

        percentage_head=`echo ${coinFlipsSingle["heads"]} 10 100 | awk '{print ($1/$2)*$3}'`
        percentage_tail=`echo ${coinFlipsSingle["tails"]} 10 100 | awk '{print ($1/$2)*$3}'`

        echo "Percentage of occurence of heads is $percentage_head"
        echo "Percentage of occurence of tails is $percentage_tail"
}

function doublet()
{
        coinFlipsDouble["HH"]=0
        coinFlipsDouble["HT"]=0
        coinFlipsDouble["TH"]=0
        coinFlipsDouble["TT"]=0

        for(( counter=1; counter<=10; counter++ ))
        do
                num1=$(( RANDOM ))
                num2=$(( RANDOM ))
                if [ $(( num1 % 2)) -eq 0  -a $(( num2%2 )) -eq 0 ]
                then
                        coinFlipsDouble["HH"]=$(( ${coinFlipsDouble[HH]}+1 ))
                elif [ $(( num1%2 )) -eq 0 -a $(( num2%2 )) -eq 1 ]
                then
                        coinFlipsDouble["HT"]=$(( ${coinFlipsDouble[HT]}+1 ))
                elif [ $(( num1%2 )) -eq 1 -a $(( num2%2 )) -eq 0 ]
                then
                        coinFlipsDouble["TH"]=$(( ${coinFlipsDouble[TH]}+1 ))
                else
                        coinFlipsDouble["TT"]=$(( ${coinFlipsDouble[TT]}+1 ))
                fi
        done

        for index in ${!coinFlipsDouble[@]}
        do
                echo "$index: ${coinFlipsDouble[$index]}"
        done

        percentage_HH=`echo ${coinFlipsDouble["HH"]} 10 100 | awk '{print ($1/$2)*$3}'`
        percentage_TT=`echo ${coinFlipsDouble["TT"]} 10 100 | awk '{print ($1/$2)*$3}'`
        percentage_HT=`echo ${coinFlipsDouble["HT"]} 10 100 | awk '{print ($1/$2)*$3}'`
        percentage_TH=`echo ${coinFlipsDouble["TH"]} 10 100 | awk '{print ($1/$2)*$3}'`

        echo "Percentage of occurence of HH is $percentage_HH"
        echo "Percentage of occurence of HT is $percentage_HT"
        echo "Percentage of occurence of TH is $percentage_TH"
        echo "Percentage of occurence of TT is $percentage_TT"

}

singlet
doublet


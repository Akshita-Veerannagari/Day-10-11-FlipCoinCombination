#! /bin/bash

declare -A coinFlipsSingle
declare -A coinFlipsDouble
declare -A coinFlipsTriple
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

function triplet()
{
        coinFlipsTriple["HHH"]=0
        coinFlipsTriple["HHT"]=0
        coinFlipsTriple["HTH"]=0
        coinFlipsTriple["HTT"]=0
        coinFlipsTriple["THH"]=0
        coinFlipsTriple["THT"]=0
        coinFlipsTriple["TTH"]=0
        coinFlipsTriple["TTT"]=0

        for(( counter=1; counter<=10; counter++ ))
        do
                num1=$(( RANDOM ))
                num2=$(( RANDOM ))
                num3=$(( RANDOM ))
                if [ $(( num1 % 2)) -eq 0  ] && [ $(( num2%2 )) -eq 0 ]  && [ $((num3%2)) -eq 0 ]
                then
                        coinFlipsTriple["HHH"]=$(( ${coinFlipsTriple[HHH]}+1 ))
                elif [ $(( num1 % 2)) -eq 0  ] && [ $(( num2%2 )) -eq 0 ]  && [ $((num3%2)) -eq 1 ]
                then
                        coinFlipsTriple["HHT"]=$(( ${coinFlipsTriple[HHT]}+1 ))
                elif [ $(( num1 % 2)) -eq 0  ] && [ $(( num2%2 )) -eq 1 ]  && [ $((num3%2)) -eq 0 ]
                then
                        coinFlipsTriple["HTH"]=$(( ${coinFlipsTriple[HtH]}+1 ))
                elif [ $(( num1 % 2)) -eq 0  ] && [ $(( num2%2 )) -eq 1 ]  && [ $((num3%2)) -eq 1 ]
                then
                        coinFlipsTriple["HTT"]=$(( ${coinFlipsTriple[HTT]}+1 ))
                elif [ $(( num1 % 2)) -eq 1  ] && [ $(( num2%2 )) -eq 0 ]  && [ $((num3%2)) -eq 0 ]
                then
                        coinFlipsTriple["THH"]=$(( ${coinFlipsTriple[THH]}+1 ))
                elif [ $(( num1 % 2)) -eq 1  ] && [ $(( num2%2 )) -eq 0 ]  && [ $((num3%2)) -eq 1 ]
                then
                        coinFlipsTriple["THT"]=$(( ${coinFlipsTriple[THT]}+1 ))
                elif [ $(( num1 % 2)) -eq 1  ] && [ $(( num2%2 )) -eq 1 ]  && [ $((num3%2)) -eq 0 ]
                then
                        coinFlipsTriple["TTH"]=$(( ${coinFlipsTriple[TTH]}+1 ))

                elif [ $(( num1 % 2)) -eq 1  ] && [ $(( num2%2 )) -eq 1 ]  && [ $((num3%2)) -eq 1 ]
                then
                        coinFlipsTriple["TTT"]=$(( ${coinFlipsTriple[TTT]}+1 ))

                fi
        done


        for index in ${!coinFlipsTriple[@]}
        do
                echo "$index: ${coinFlipsTriple[$index]}"
        done

        percentage_HHH=`echo ${coinFlipsTriple["HHH"]} 10 100 | awk '{print ($1/$2)*$3}'`
        percentage_HHT=`echo ${coinFlipsTriple["HHT"]} 10 100 | awk '{print ($1/$2)*$3}'`
        percentage_HTH=`echo ${coinFlipsTriple["HTH"]} 10 100 | awk '{print ($1/$2)*$3}'`
        percentage_HTT=`echo ${coinFlipsTriple["HTT"]} 10 100 | awk '{print ($1/$2)*$3}'`
        percentage_THH=`echo ${coinFlipsTriple["THH"]} 10 100 | awk '{print ($1/$2)*$3}'`
        percentage_THT=`echo ${coinFlipsTriple["THT"]} 10 100 | awk '{print ($1/$2)*$3}'`
        percentage_TTH=`echo ${coinFlipsTriple["TTH"]} 10 100 | awk '{print ($1/$2)*$3}'`
        percentage_TTT=`echo ${coinFlipsTriple["TTT"]} 10 100 | awk '{print ($1/$2)*$3}'`


        echo "Percentage of occurence of HHH is $percentage_HHH"
        echo "Percentage of occurence of HHT is $percentage_HHT"
        echo "Percentage of occurence of HTH is $percentage_HTH"
        echo "Percentage of occurence of HTT is $percentage_HTT"
        echo "Percentage of occurence of THH is $percentage_THH"
        echo "Percentage of occurence of THT is $percentage_THT"
        echo "Percentage of occurence of TTH is $percentage_TTH"
        echo "Percentage of occurence of TTT is $percentage_TTT"


}

singlet
doublet
triplet

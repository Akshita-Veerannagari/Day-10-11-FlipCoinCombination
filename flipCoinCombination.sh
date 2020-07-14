#! /bin/bash

num=$(( RANDOM ))
if [ $(( num % 2)) -eq 0 ]
then
        echo "You got heads"
else
        echo "You got tails"
fi


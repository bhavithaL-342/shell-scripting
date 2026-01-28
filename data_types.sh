#!/bin/bash

NUM1=100
NUM2=200

SUM=$(($NUM1+$NUM2))

echo "sum is: $SUM"



#Array(list of items)
FRUITS=("Apple" "Banana" "Guava")

echo "FRUITS are: ${FRUITS[@]}"
echo "FRUITS 1: ${FRUITS[0]}"
echo "FRUITS 2: ${FRUITS[1]}"
echo "FRUITS 3: ${FRUITS[2]}"

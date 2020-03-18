#!/bin/bash

while [[ 0 ]]
do
	echo "Введите выражение: "
	read op1 operation op2

	if [[ "$op1" == "exit" ]] 
	then 
		echo "Выход"
		break
	elif [[ "$op1" =~ ^(-)?[0-9]+$ && "$op2" =~ ^(-)?[0-9]+$ ]]
	then
		case $operation in
		"+") result=$(( "$op1 + $op2" ));;
		"-") result=$(( "$op1 - $op2" ));;
		"*") result=$(( "$op1 * $op2" ));;
		"/") result=$(( "$op1 / $op2" ));;
		"^") result=$(( "$op1 ** $op2" ));;
		*) echo "Ошибка"; continue;
		esac
		echo "$result"
	elif [[ "$op1" =~ ^[0-9]+$ && "$op2" == "" ]]
	then
		case $operation in
		"sqrt") result=$( echo "scale=5;sqrt($op1)" | bc );;
		*) echo "Ошибка"; continue;;
		esac
		echo "$result"
	else
		echo "Ошибка"
		continue
	fi

done

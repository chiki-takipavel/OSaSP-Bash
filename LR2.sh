#!/bin/bash

IFS=$'\n'
counter=0
search=0
echo "Введите поисковой запрос"
read search
list=$(find ./ -depth -type f)
for var in $list
do
	if grep -q $search $var
	then
		counter=$(( $counter + 1 ))
		size=$(( $size + $(wc -c $var | awk '{print $1}') ))
		echo "$var"
	fi
done
echo "Размер файлов: $size"
echo "Всего файлов: $counter"

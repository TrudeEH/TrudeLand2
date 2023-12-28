#! /bin/bash

cd /sys/class/hwmon/

final=""

for dir in */; do
	nameFile=$(cat $dir"name")
	tempFile=$(cat $dir"temp1_input")

	tempFile=${tempFile::-3}

	if [[ $nameFile == *"core"* ]]; then
		final="$final $tempFileºC  ‎"
	fi

	if [[ $nameFile == *"gpu"* ]]; then
		final="$final ‎ $tempFileºC 󰍹 "
	fi

done

echo $final

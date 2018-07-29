#!/bin/bash
# Get current cryptocurrencies prices
# URL: https://github.com/zevilz/CurCryptoPrices
# Author: Alexandr "zEvilz" Emshanov
# License: MIT
# Version: 0.2.0

# vars
CRYPTOCURRENCIES=(BTC ETH XRP)
CURRENCIES=(USD RUB)
JSON_FILE="$(dirname "$0")/prices.json"
ITERATIONS=1
ITERATIONS_DELAY=10
INHERIT_PERMISSIONS=0

# prepare API args
FSYMS=$(IFS=',';echo "${CRYPTOCURRENCIES[*]// /|}";IFS=$' \t\n')
TSYMS=$(IFS=',';echo "${CURRENCIES[*]// /|}";IFS=$' \t\n')

for ((i=0; i <= $ITERATIONS; i++)); do

	# get current prices from API
	API_RESPONSE=$(curl --silent "https://min-api.cryptocompare.com/data/pricemulti?fsyms=$FSYMS&tsyms=$TSYMS")

	# check API response
	API_CRYPTOCURRENCIES_ISSET=1
	for C in "${!CRYPTOCURRENCIES[@]}"; do

		if ! [[ $API_RESPONSE =~ \"${CRYPTOCURRENCIES[C]}\"\:\{\" ]]; then
			API_CRYPTOCURRENCIES_ISSET=0
		fi

	done

	if [ $API_CRYPTOCURRENCIES_ISSET -eq 1 ]; then

		# responce good. write in file
		echo $API_RESPONSE > $JSON_FILE

		if [ $INHERIT_PERMISSIONS -eq 1 ]; then

			# change permissions to json file like main script
			if [[ "$OSTYPE" == "linux-gnu" ]]; then
					SCRIPT_OWNER=$(stat -c "%U:%G" "$0")
					SCRIPT_PERMS=$(stat -c "%a" "$0")
				else
					SCRIPT_OWNER=$(ls -l "$0" | awk '{print $3":"$4}')
					SCRIPT_PERMS=$(stat -f "%Lp" "$0")
			fi
			chown $SCRIPT_OWNER "$JSON_FILE"
			chmod $SCRIPT_PERMS "$JSON_FILE"

		fi

	else

		# responce bad or invalid data given
		echo "Can't receive selected data from API!"
		echo
		echo '$API_RESPONSE = '$API_RESPONSE
		echo '$FSYMS = '$FSYMS
		echo '$TSYMS = '$TSYMS

	fi

	if ! [ $i -eq $ITERATIONS ]; then
		sleep $ITERATIONS_DELAY
	fi

done

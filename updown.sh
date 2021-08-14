#!/bin/bash

helpmsg() {
	echo ""
	echo "Usage: $0 <network_prefix>"
	echo ""
	echo "Network prefix should be in this format: XXX.XXX.XXX"
	echo ""
}

if [ $# -eq 0 ];
then
	echo "Error: Network Prefix not supplied!"
	helpmsg
	exit 1
fi

netpref=$1

for i in {1..255}
do
	ping -c 1 -W 0.2 $netpref.$i &>/dev/null
	if [ $? -eq 0 ]; then
		echo -e "Host $netpref.$i is \e[92mup\e[39m!"
	else
		echo -e "Host $netpref.$i is \e[91mdown\e[39m!"
	fi
done

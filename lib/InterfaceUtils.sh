#!/bin/bash

# The methods used in this script are taken from airmon-ng.
# This is all thanks for the airmon-ng authors, thanks guys.

function interface_list_all() {
	InterfaceListAll=($(ls -1 /sys/class/net))
}

function interface_list_wireless() {
	InterfaceListWireless=()
	interface_list_all
	local __interface_list_wireless__candidate
	for __interface_list_wireless__candidate in "${InterfaceListAll[@]}"; do
		if grep -q "DEVTYPE=wlan" /sys/class/net/$__interface_list_wireless__candidate/uevent 2> /dev/null
		then InterfaceListWireless+=("$__interface_list_wireless__candidate")
		fi
	done
}
#!/bin/sh

action=$1

if [ "$action" = "on" ];then
	curl -H  'glinet: 1' -s -k http://127.0.0.1/rpc -d "{\"jsonrpc\":\"2.0\",\"method\":\"call\",\"params\":[\"\",\"adguardhome\",\"set_config\",{\"enabled\":true}],\"id\":1}"
fi

if [ "$action" = "off" ];then
	curl -H  'glinet: 1' -s -k http://127.0.0.1/rpc -d "{\"jsonrpc\":\"2.0\",\"method\":\"call\",\"params\":[\"\",\"adguardhome\",\"set_config\",{\"enabled\":false}],\"id\":1}"
fi

sleep 5

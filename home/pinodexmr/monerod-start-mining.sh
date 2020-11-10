#!/bin/bash
#Establish IP
DEVICE_IP="$(hostname -I)"
#Import Start Flag Values:
	#Import Port Number
	. /home/pinodexmr/monero-port.sh
	#Import Block Sync Size
	. /home/pinodexmr/monero-block-sync-size.sh
	#Set Sync Mode (Safe,Fast,Fastest)
	. /home/pinodexmr/db-sync-mode.sh
	#Import "IN-PEERS" (connections) Limit
	. /home/pinodexmr/in-peers.sh
	#Import "OUT-PEERS" (connections) Limit
	. /home/pinodexmr/out-peers.sh
	#Import Data Limit Up
	. /home/pinodexmr/limit-rate-up.sh
	#Import Data Limit Down
	. /home/pinodexmr/limit-rate-down.sh
	#Import Mining Address
	. /home/pinodexmr/mining-address.sh
	#Import Mining Intensity
	. /home/pinodexmr/mining-intensity.sh
	#Import RPC username
	. /home/pinodexmr/RPCu.sh
	#Import RPC password
	. /home/pinodexmr/RPCp.sh
#Omitted commands - for future versions, unstable for now.
	#--block-sync-size=$MONERO_BLOCK_SYNC_SIZE --db-sync-mode=$DB_SYNC_MODE 
#Output the currently running node mode
echo "Clearnet Node - Mining [YES]" > /var/www/html/iamrunning_version.txt
	echo "#!/bin/sh
BOOT_STATUS=5" > /home/pinodexmr/bootstatus.sh
#Allow time for previous service stop
sleep "10"
#Start Monerod
cd /home/pinodexmr/monero-active/
./monerod --ban-list --rpc-bind-ip=$DEVICE_IP --rpc-bind-port=$MONERO_PORT --confirm-external-bind --rpc-login=$RPCu:$RPCp --rpc-ssl disabled --in-peers=$IN_PEERS --out-peers=$OUT_PEERS --limit-rate-up=$LIMIT_RATE_UP --limit-rate-down=$LIMIT_RATE_DOWN --log-file=/var/www/html/monerod.log --max-log-file-size=10485000  --log-level=1 --max-log-files=1 --pidfile /home/pinodexmr/monero-active/monerod.pid --start-mining=$MINING_ADDRESS --bg-mining-miner-target=$MINING_INTENSITY --detach

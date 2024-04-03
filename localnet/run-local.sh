#!/bin/bash

rm -rf ~/.relayer/

rly config init --memo "My custom memo"
rly chains add --file ./local/cele-chain.json cele
echo "rly chains added cele"

rly chains add --file ./local/celestia-chain.json celestia
echo "rly chains added celestia"

rly chains show cele
rly chains show celestia

echo "begin sleeping 10 seconds"
cp -r  ./keys ~/.relayer/

rly keys list cele
rly keys list celestia

rly keys add cele validator1
rly keys add celestia node0


rly q balance cele validator1
rly q balance celestia node0

# rly paths new [src-chain-id] [dst-chain-id] [path-name] [flags]
rly paths new cele-9000 celestia-9002 test_path

#sleep 20
#echo "rly transact clients test_path"
#rly transact clients test_path

echo "rly transact connection test_path"
sleep 60
rly transact connection test_path --block-history 40


echo "rly transact channel test_path"
sleep 10
rly transact channel test_path --src-port transfer --dst-port transfer --order unordered --version ics20-1


#rly transact link test_path --version "{\"fee_version\":\"ics29-1\",\"app_version\":\"ics20-1\"}"

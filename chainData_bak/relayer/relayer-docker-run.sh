#!/bin/bash

rly config init
rly chains add --file ./relayer/cele-chain.json cele
echo "rly chains added cele"

rly chains add --file ./relayer/celestia-chain.json celestia
echo "rly chains added celestia"

rly chains show cele
rly chains show celestia

cp -r ./relayer/keys ~/.relayer/

echo "begin sleeping 60 seconds"
sleep 50

rly keys list cele
rly keys list celestia

rly keys add cele validator1
rly keys add celestia node0

rly q balance cele validator1
rly q balance celestia node0

# rly paths new [src-chain-id] [dst-chain-id] [path-name] [flags]
rly paths new cele-9000 celestia-9002 test_path --order unordered --version ics20-1

sleep 20
echo "rly transact clients test_path"
rly transact link test_path --debug --order unordered
#rly transact link test_path --debug --src-port transfer --dst-port transfer --order unordered --version ics20-1

#rly transact channel test_path --src-port transfer-1 --dst-port transfer-1 --order ordered --version ics20-1 --debug

echo -e "link successed!!!\n\n\n\n\n\n\n\n"

# echo "rly start"
rly start --debug

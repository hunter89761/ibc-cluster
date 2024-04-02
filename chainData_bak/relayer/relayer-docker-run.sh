#!/bin/bash

rly config init
rly chains add --file ./relayer/cele-chain.json cele
echo "rly chains added cele"

rly chains add --file ./relayer/celestia-chain.json celestia
echo "rly chains added celestia"

rly chains show cele
rly chains show celestia

echo "begin sleeping 10 seconds"
sleep 10

#
#rly keys add cele validator1
#rly keys add celestia node0

mv ./relayer/keys ~/.relayer/

rly keys use cele validator1
rly keys use celestia node0


rly q balance cele validator1
rly q balance celestia node0

# rly paths new [src-chain-id] [dst-chain-id] [path-name] [flags]
rly paths new cele-9000 celestia-9002 test_path

echo "rly trnasact link test_path"

rly transact link test_path

sleep 1000

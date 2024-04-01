#!/bin/bash

rly config init
rly chains add --file ./relayer/evmos-chain.json evmos
echo "rly chains added evmos"

rly chains add --file ./relayer/celestia-chain.json celestia
echo "rly chains added celestia"

rly chains show evmos
rly chains show celestia

echo "begin sleeping 10 seconds"
sleep 10

#
#rly keys add evmos validator1
#rly keys add celestia node0

mv ./relayer/keys ~/.relayer/

sleep 10

rly keys use evmos validator1
rly keys use celestia node0


rly q balance evmos validator1
rly q balance celestia node0

# rly paths new [src-chain-id] [dst-chain-id] [path-name] [flags]
rly paths new evmos_9000-1 celestia-9002 test_path

echo "rly trnasact link test_path"

rly transact link test_path

sleep 1000

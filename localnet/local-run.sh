#!/bin/bash

rm -rf ~/.relayer/

rly config init
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

echo "rly trnasact link test_path"

rly transact link test_path

sleep 1000

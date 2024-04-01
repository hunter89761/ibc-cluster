#!/bin/bash

rm -rf ~/.relayer/

rly config init
rly chains add --file ./local/evmos-chain.json evmos
echo "rly chains added evmos"

rly chains add --file ./local/celestia-chain.json celestia
echo "rly chains added celestia"

rly chains show evmos
rly chains show celestia

echo "begin sleeping 10 seconds"
sleep 10

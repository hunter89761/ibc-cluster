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

rly keys restore evmos evmos1 \
"smart usage nerve wedding derive math inmate convince pond hidden resemble wagon language wheat cigar various sniff crumble tired evil much buyer decorate travel"

rly keys restore celestia celestia1 \
"smart usage nerve wedding derive math inmate convince pond hidden resemble wagon language wheat cigar various sniff crumble tired evil much buyer decorate travel"


rly keys use evmos evmos1
rly keys use celestia celestia1


rly q balance evmos evmos1
rly q balance celestia celestia1

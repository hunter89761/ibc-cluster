#!/bin/bash

rly config init --home "./relayer"
rly chains add cosmoshub osmosis --home "./relayer"

rly keys restore cosmoshub cosmoshub1 \
"test test test test test test test test test test test junk" \
--home "./relayer"

rly keys restore osmosis osmosis1 \
"test test test test test test test test test test test junk" \
--home "./relayer"

rly keys use cosmoshub cosmoshub1 --home "./relayer"
rly keys use osmosis osmosis1 --home "./relayer"

rly q balance cosmoshub cosmoshub1 --home "./relayer"
rly q balance osmosis osmosis1 --home "./relayer"


rly paths fetch --home "./relayer"

rly paths list --home "./relayer"
rly start --home "./relayer"
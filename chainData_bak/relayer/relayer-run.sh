#!/bin/bash

rly config init --home "./relayer"
rly chains add evmos injective --home "./relayer"

rly keys restore evmos evmos1 \
"test test test test test test test test test test test junk" \
--home "./relayer"

rly keys restore injective injective1 \
"test test test test test test test test test test test junk" \
--home "./relayer"

rly keys use evmos evmos1 --home "./relayer"
rly keys use injective injective1 --home "./relayer"

rly q balance evmos evmos1 --home "./relayer"
rly q balance injective injective1 --home "./relayer"


rly paths fetch --home "./relayer"

rly paths list --home "./relayer"
rly start --home "./relayer"
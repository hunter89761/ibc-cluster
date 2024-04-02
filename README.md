# ibc-cluster

### chain-id

```shell
cast chain-id
cast chain-id --rpc-url http://localhost:18545
```

### relayer
```shell
rly config init --home "./relayer1"
rly chains add cosmoshub osmosis --home "./relayer1"

rly keys restore cosmoshub cosmoshub1 \
"test test test test test test test test test test test junk" \
--home "./relayer1"

rly keys restore osmosis osmosis1 \
"test test test test test test test test test test test junk" \
--home "./relayer1"

rly keys use cosmoshub cosmoshub1 --home "./relayer1"
rly keys use osmosis osmosis1 --home "./relayer1"

rly q balance cosmoshub cosmoshub1 --home "./relayer1"
rly q balance osmosis osmosis1 --home "./relayer1"


rly paths fetch --home "./relayer1"

rly paths list --home "./relayer1"
rly start --home "./relayer1"
```

### cast
```shell
cast bl 1
cast bl 1 --rpc-url http://localhost:18545
```


### relayer
```shell
rly chains add --file cele-chain.json
```
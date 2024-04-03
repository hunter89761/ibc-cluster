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

### config change
```shell
# disable discard abci response
discard_abci_responses = false

## enable tx indexer
indexer = "kv"
```

### query connection
```shell

# celestia-9002
celestia-appd query ibc connection connections --node tcp://localhost:36657

# cele-9000
celestia-appd query ibc connection connections --node tcp://localhost:26657


# celestia-9002
celestia-appd query ibc client state 07-tendermint-0 --node tcp://localhost:36657

# cele-9000
celestia-appd query ibc client state 07-tendermint-0 --node tcp://localhost:26657

```
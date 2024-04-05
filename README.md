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

### transfer
```shell
# address : 4afb210b134ee836ed1b16701677d862c876a254
# address: c019ed6c84bcbce9665a0ae23dde87786908f3d5
celestia-appd-ucele query bank balances cele1ftajzzcnfm5rdmgmzecpva7cvty8dgj5ynjqrk

celestia-appd-ucele query bank balances cele16qv76myyhj7wjej6pt3rmh580p5s3u7eu0z2h6

celestia-appd query bank balances \
celestia1ftajzzcnfm5rdmgmzecpva7cvty8dgj5x3qllr \
--node tcp://localhost:36657

celestia-appd query bank balances \
celestia1cqv76myyhj7wjej6pt3rmh580p5s3u74c3m8yx \
--node tcp://localhost:36657

```


```shell
# cele-9000
# d019ed6c84bcbce9665a0ae23dde87786908f3d9
# celestia-appd keys parse d019ed6c84bcbce9665a0ae23dde87786908f3d9
# cele16qv76myyhj7wjej6pt3rmh580p5s3u7eu0z2h6

celestia-appd-ucele tx bank send cele1ftajzzcnfm5rdmgmzecpva7cvty8dgj5ynjqrk \
cele16qv76myyhj7wjej6pt3rmh580p5s3u7eu0z2h6 \
100ucele --chain-id cele-9000 \
--node http://localhost:26657 --gas 200000 \
--gas-prices 0.025ucele --broadcast-mode block \
--home ./localnet/keys/cele-9000 --keyring-backend test \
-y

# query the tx hash
celestia-appd-ucele query tx \
296C608861D2A92962283A5939FC68DE2F82DF48F81E527ED9726F7817FBF66C
```

```shell
### import the sender key

celestia-appd-ucele tx bank send cele1ftajzzcnfm5rdmgmzecpva7cvty8dgj5ynjqrk \
cele16qv76myyhj7wjej6pt3rmh580p5s3u7eu0z2h6 \
100ucele --chain-id cele-9000 \
--node http://localhost:26657 --gas 200000 \
--gas-prices 0.025ucele --broadcast-mode block \
--home ./localnet/keys/cele-9000 --keyring-backend test \
-y

# in the root path
celestia-appd-ucele tx ibc-transfer transfer transfer channel-0 \
celestia1cqv76myyhj7wjej6pt3rmh580p5s3u74c3m8yx 100ucele \
--from cele1ftajzzcnfm5rdmgmzecpva7cvty8dgj5ynjqrk \
--chain-id cele-9000 \
--node http://localhost:26657 --gas 200000 \
--gas-prices 0.025ucele --broadcast-mode block \
--home ./localnet/keys/cele-9000 --keyring-backend test -y
```
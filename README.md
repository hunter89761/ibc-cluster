# ibc-cluster

### 
```shell
./start.sh

### send transaction
celestia-appd-ucele tx ibc-transfer transfer transfer channel-0 \
celestia1cqv76myyhj7wjej6pt3rmh580p5s3u74c3m8yx 10000000ucele \
--from cele1ftajzzcnfm5rdmgmzecpva7cvty8dgj5ynjqrk \
--chain-id cele-9000 \
--node http://localhost:26657 --gas 200000 \
--gas-prices 0.025ucele --broadcast-mode block \
--home ./localnet/keys/cele-9000 --keyring-backend test -y

### query balance

celestia-appd-ucele query bank balances cele1ftajzzcnfm5rdmgmzecpva7cvty8dgj5ynjqrk

celestia-appd-ucele query bank balances cele1ftajzzcnfm5rdmgmzecpva7cvty8dgj5ynjqrk
celestia-appd query bank balances \
celestia1cqv76myyhj7wjej6pt3rmh580p5s3u74c3m8yx \
--node tcp://localhost:36657

celestia-appd query bank balances \
celestia1cqv76myyhj7wjej6pt3rmh580p5s3u74c3m8yx \
--node tcp://localhost:36657
```
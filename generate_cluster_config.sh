#!/bin/bash


### generate cluster1

rm -rf ./chainData_bak/ernest1
evmosd testnet init-files --v 3 -o ./chainData_bak/ernest1 --keyring-backend=test --starting-ip-address 192.167.10.2 --chain-id evmos_9000-1

  for i in {0..2}; do
    APP_TOML="./chainData_bak/ernest1/node$i/evmosd/config/app.toml"
    GENESIS="./chainData_bak/ernest1/node$i/evmosd/config/genesis.json"
    TMP_GENESIS="./chainData_bak/ernest1/node$i/evmosd/config/tmp_genesis.json"
    DATADIR="./chainData_bak/ernest1/node$i/evmosd/data"

  	# Set gas limit in genesis
	  jq '.consensus_params["block"]["max_gas"]="30000000"' "$GENESIS" >"$TMP_GENESIS" && mv "$TMP_GENESIS" "$GENESIS"

    if [[ "$OSTYPE" == "darwin"* ]]; then
        sed -i '' 's/127.0.0.1/0.0.0.0/g' "$APP_TOML"
    else
        sed -i 's/127.0.0.1/0.0.0.0/g' "$APP_TOML"
    fi
    rm -rf $DATADIR
    mkdir -p $DATADIR
    cp ./priv_validator_state.json $DATADIR
  done

### generate cluster2

#!/bin/bash

git clone git@github.com:hunter89761/evmos-chain.git
cd evmos-chain
make build
sudo rm -rf /Users/shiwb/go/bin/evmosd
sudo cp -r build/evmosd  /Users/shiwb/go/bin/evmosd

docker build -t webbshi/evmosd .


git clone git@github.com:hunter89761/relayer.git
cd relayer
git checkout v2.4.0
make install
# the binary file is rly

#!/bin/bash

git clone git@github.com:hunter89761/evmos-chain.git
cd evmos-chain
make build
sudo rm -rf /Users/shiwb/go/bin/evmosd
sudo cp -r build/evmosd  /Users/shiwb/go/bin/evmosd

docker build -t 0/evmosd .
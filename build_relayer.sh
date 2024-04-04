#!/bin/bash
#
#git clone git@github.com:hunter89761/evmos-chain.git
#cd evmos-chain
#make build
#sudo rm -rf /Users/shiwb/go/bin/evmosd
#sudo cp -r build/evmosd  /Users/shiwb/go/bin/evmosd
#
#docker build -t webbshi/evmosd .
#docker push webbshi/evmosd
#cd ..

docker build -t webbshi/ibc-relayer .
docker push webbshi/ibc-relayer


#git checkout v2.4.0
#make install
# the binary file is rly


git clone git@github.com:hunter89761/celestia-app.git
cd celestia-app

git checkout ernest/da-chain-ucele
docker build . -t webbshi/celestia-app-ucele:v1.6.0

docker push webbshi/celestia-app-ucele:v1.6.0
cd ..
#!/bin/bash

#!/bin/bash

rm -rf ~/.relayer/

rly config init --memo "My custom memo"
rly chains add --file ./local/cele-chain.json cele
echo "rly chains added cele"

rly chains add --file ./local/celestia-chain.json celestia
echo "rly chains added celestia"

rly chains show cele
rly chains show celestia

cp -r  ./keys ~/.relayer/

rly keys list cele
rly keys list celestia

rly keys add cele validator1
rly keys add celestia node0


rly q balance cele validator1
rly q balance celestia node0
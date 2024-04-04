#!/bin/bash

rm -rf chainData
mkdir chainData

cp -r ./cele-network chainData
docker-compose -f docker-compose-only-cele.yml up -d
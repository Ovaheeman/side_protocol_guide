#!/bin/bash

export SIDED_KEYRING_BACKEND=os
sided keys add test --key-type="segwit"

sided init <MY_SIDE_VALIDATOR> --chain-id=grimoria-testnet-1

wget https://raw.githubusercontent.com/sideprotocol/testnet/main/grimoria-testnet-1/genesis.json -O $HOME/.side/config/genesis.json

cd $HOME/.side/config
sed -i 's|persistent_peers = ""|persistent_peers = "6bef0693d7a31fed473b95123ad19b544b414093@202.182.119.24:26656,44f8009ed91fddd7ee51117482ede20fb4f33e78@149.28.156.79:26656"|g' config.toml

sed -i 's|minimum-gas-prices = ""|minimum-gas-prices = "0.005uside"|g' app.toml

sided tendermint unsafe-reset-all
sided start

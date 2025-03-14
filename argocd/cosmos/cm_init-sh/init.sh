#!/bin/sh
# Set up a Gaia service to join the provider chain.

NODE_HOME=$HOME
NODE_MONIKER=$(hostname)
GAS_PRICE=0.005uatom
CHAIN_BINARY='gaiad'
CHAIN_ID=provider
GENESIS_URL=https://github.com/cosmos/testnets/raw/master/interchain-security/provider/provider-genesis.json
SEEDS="08ec17e86dac67b9da70deb20177655495a55407@provider-seed-01.ics-testnet.polypore.xyz:26656,4ea6e56300a2f37b90e58de5ee27d1c9065cf871@provider-seed-02.ics-testnet.polypore.xyz:26656"
SNAPSHOT_URL=https://snapshots.polypore.xyz/ics-testnet/provider/latest.tar.gz

# Initialize home directory
echo "Initializing $NODE_HOME..."
rm -rf "$NODE_HOME"
$CHAIN_BINARY config set client chain-id $CHAIN_ID --home "$NODE_HOME"
$CHAIN_BINARY config set client keyring-backend test --home "$NODE_HOME"
$CHAIN_BINARY init "$NODE_MONIKER" --chain-id $CHAIN_ID --home "$NODE_HOME"
sed -i -e "/minimum-gas-prices =/ s^= .*^= \"$GAS_PRICE\"^" "$NODE_HOME/config/app.toml"
sed -i -e "/seeds =/ s^= .*^= \"$SEEDS\"^" "$NODE_HOME/config/config.toml"

echo "Downloading snapshot..."
rm -rf "$NODE_HOME/wasm" "$NODE_HOME/data"
wget -qO- $SNAPSHOT_URL | tar vxz -C "$NODE_HOME"

# Replace genesis file
wget $GENESIS_URL -O /tmp/genesis.json
mv /tmp/genesis.json "$NODE_HOME/config/genesis.json"

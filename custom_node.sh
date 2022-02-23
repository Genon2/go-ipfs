#!/bin/sh
go get "github.com/Genon2/ipfs-thesis-bitswap" # Upgrading custom bitswap module
make build
cd cmd/ipfs/
./ipfs daemon

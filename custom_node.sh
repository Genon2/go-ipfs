#!/bin/sh
echo Hello, You are running a script and we need last commit of bitswap to test. Introduce only the last commit from : https://github.com/Genon2/ipfs-thesis-bitswap 
read input
sed -i 's/BITSWAP/'$input'/g' go.mod
go mod tidy
go mod vendor
go get "github.com/Genon2/ipfs-thesis-bitswap" # Upgrading custom bitswap module
make build
sed -i '6d' go.mod
sed -i '6 i github.com/Genon2/ipfs-thesis-bitswap BITSWAP' go.mod
cd cmd/ipfs/
./ipfs daemon

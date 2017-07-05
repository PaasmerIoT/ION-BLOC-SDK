#!/bin/bash
echo "Updating System...."
apt-get update
cd /home/pi/
echo "Downloading Golang File...."
wget https://storage.googleapis.com/golang/go1.8.3.linux-armv6l.tar.gz
echo "Extracting & Installing Golang File...."
tar -xzf go1.8.3.linux-armv6l.tar.gz
cp -r go /usr/local/
export PATH=$PATH:/usr/local/go/bin 
echo "Installation Ethereum Client -- Go-Ethereum...." 
cp /home/pi/Desktop/ION-BLOC-SDK/Go-Ethereum/geth /usr/local/bin/
chmod 777 /usr/local/bin/geth
apt-get install -y python-software-properties
echo "Downloading and Installing Nodejs and npm...."
curl -sL https://deb.nodesource.com/setup_8.x | sudo -E bash -
apt-get install -y nodejs
apt-get install -y nodejs npm 
echo "Installed Software Version ........"
echo "Geth Version...."
geth version
echo "Go Version...."
go version
echo "Nodejs Version...."
node -v 
echo "npm Version...."
npm -v
cd ../..
echo "Voila!!! Now your ready to connect to our Private Blockchain Network"
echo "Connecting to Private Blockchain......."
cd /home/pi/Desktop/
mkdir Blockchain && cd Blockchain
geth --datadir "aws" init "/home/pi/Desktop/ION-BLOC-SDK/Genesis/genesis.json"
geth --datadir "aws" --networkid 1234 --port 30303 --rpc --rpcport 8545 --rpccorsdomain "*" --nodiscover console








# Ion-Block SDK 

This SDK will help you to add to our existing Private Blockchain network from your Raspberry Pi -3.

**Prerequisite:**

1. Raspberry Pi 3 with [Raspbian Jessie](https://www.raspberrypi.org/downloads/raspbian/) installed in 16 GB micro SD card.
2. Stable internet connection with minimum 500 kbps speed.

**Installation:**

Download or clone this GitHub repository in your RPI-3 and extract it to the Desktop, using below command.

```
$ cd Desktop

$ git clone https://github.com/PaasmerIoT/ION-BLOC-SDK.git

$ cd ION-BLOC-SDK
```

- Now you have successfully cloned the GitHub repository to your Desktop.
- To install the necessary software run the installation script using the below command.

```
$ sudo sh install.sh
```

- This script will first update your OS, then start to install the stable version of Golang, Go-Ethereum, node, and npm.
- After the installation, you will get a greeting messages with the version number of software installed.
- And then this script will allow you to enter into the geth console where you can join our Private Blockchain network, using the following commands.

In geth console 

* Creating an account:

```
personal.newAccount("password")              
```

Password -- Give your custom password 

*Note: Remember your password, Since we can't able to change it in future.*
 
- Connect to our Private Blockchain Network 

```
admin.addPeer("enode://f194a9aa126c640a141202a083b3edcd65785ca8ec6fa7c5d77065ef918c6a01d49512147826c11d2c60f6c1551eb5a120c33a16fb0c31f0879d582a4c247c7b@54.214.225.10:30303")
```

- Check the peering 

```
admin.peers
```

- Peering will initially take the time to happen. Once it was done then block synchronization will happen, which you can able to view it in your geth console.

>The `contract.js` file in the contract folder will help you to compile and deploy contract in blockchain.

## Sample Code for controlling the IoT using Ion-Block was given in IoT-Blink folder.
    This code will allow users to deploy the contract and control the blinkibng of LED based on the events.

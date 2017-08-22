# IoT-Blink

This Readme file will guide you to deploy a contract in IoT blockchain and control the devices based on the events triggered while deploying it.

**Prerequisite:**

- Raspberry Pi 3 with [raspbian jessie](https://www.raspberrypi.org/downloads/raspbian/) installed in 16 GB micro SD card.-
- Go-Ethereum, Golang, node and npm preinstalled using the install.sh file.
- Connected to our Private Blockchain.
- You should have a personal account with some ethers (minimum 0.0012 ethers) for submitting the contract.

**Execution:**

Create the Project folder using the commands.

```sh
$ cd Desktop 
$ mkdir Blink && cd Blink
```

Initialize the node Project using the command.

```sh
$ npm init
```

Enter the project details in the terminal and save the package.json file 

In that project folder, install web3 and onoff modules using the commands.

```Gentoo Ebuild
$ npm install web3 --save
$ npm install onoff --save
```

Wire up the LED and make sure your LED can blink by the nodejs program 

- Connect the positive end of LED(5v) to pin 11 and the negative end to pin 9(GND).
- Open a new terminal in your RPI-3.
- Create a project folder
    
```sh
$ mkdir blink
$ cd blink
$ npm init 
$ npm install onoff --save
```

- Now we will create a new file named blink.js inside the project folder.

```bash
$ nano blink.js  
``` 
- copy the below code to the blink.js file and save it.

```javascript
    var Gpio = require('onoff').Gpio,
    led = new Gpio(17, 'out');
 
    var iv = setInterval(function(){
        led.writeSync(led.readSync() === 0 ? 1 : 0)
    }, 500);
 
    // Stop blinking the LED and turn it off after 5 seconds.
    setTimeout(function() {
        clearInterval(iv); // Stop blinking
        led.writeSync(0);  // Turn LED off.
        led.unexport();    // Unexport GPIO and free resources
    }, 5000);

```
The above code will make to blink the LED for 5s 

- Run the code using the command.

```sh
$ sudo node blink.js    
```

Let's use the blockchain now. 

- In terminal start the geth console and connect it to the Private Blockchain.

``` sh
$ cd /home/pi/Desktop/Blockchain
$ geth --datadir "aws" --networkid 5432 --port 30303 --rpc --rpcport 8545 --rpccorsdomain "*" --nodiscover console
admin.addPeer("enode://f194a9aa126c640a141202a083b3edcd65785ca8ec6fa7c5d77065ef918c6a01d49512147826c11d2c60f6c1551eb5a120c33a16fb0c31f0879d582a4c247c7b@54.214.225.10:30303")
admin.peers
```
- Unlock the personal account for deploying the contract.

```javascript
personal.unlockAccount(eth.accounts[0])
```

- Deploy contract using contract.js file in the contract tab.
- Once the contract was deployed note down the contract address.
- In the blink.js file replace the contract address with your contract address.
- Open the new terminal and run the blink.js file 

```sh
$ sudo node blink.js
```
- In online compiler enter the value for Blink and submit the transaction. Once the transaction was deployed you can find the success message in the terminal followed by LED blinking for a particular time.
    
- Voila!!!

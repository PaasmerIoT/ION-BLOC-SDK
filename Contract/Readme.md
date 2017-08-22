# Contract Deployment

This Readme will help you to compile and deploy contract in Ethereum Blockchain.

**Prerequisite:**
 - You should install ***web3, fs and solc***  dependencies using the below command.
 ```sh
 $ npm install web3 --save
 $ npm install fs --save
 $ npm install solc@0.4.13 --save
 ```
 - Unlock the account from the console
 ``` javascript
 personal.unlockAccount(eth.accounts[0])
```
 - Miner needs to run on the blockcchain to add a block.

**Execution**
 - Replace the contract.sol file with your contract code.
 - Open new terminal and execute the contract.js file
 ```sh
 $ cd /home/pi/Desktop/Blockchain
 $ node contract.js
 ```
> **After successfull execution in terminal you can view the contract address.**

const fs = require('fs');
const Web3 = require('web3');
const solc = require('solc');
const web3 = new Web3(new Web3.providers.HttpProvider("http://localhost:8545"));
let source = fs.readFile('Token.sol', 'utf8', function(err, data) {
    if (err) throw err;
    //console.log(data);      //Contract File
    var Compile = solc.compile(data,1);
   console.log(Compile);    //Compiled Contract
   // code and ABI that are needed by web3
    for (var contractName in Compile.contracts)
    {
      let CompileBytecode = Compile.contracts[contractName].bytecode;           //Contract Bytecode
      let CompileAbi = JSON.parse(Compile.contracts[contractName].interface);   //Contract Application Binary Interface
      const contract = web3.eth.contract(CompileAbi);
      console.log(contract);
      console.log(CompileBytecode);
      console.log(CompileAbi);
      const contractInstance = contract.new({
    data: '0x' + CompileBytecode,
    from: web3.eth.coinbase,
    gas: 90000*2
}, (err, res) => {
    if (err) {
        console.log(err);
        return;
    }

    // Log the tx, you can explore status with eth.getTransaction()
    console.log('transaction Hash: ' + res.transactionHash);
    // If we have an address property, the contract was deployed
    if (res.address) {
        console.log('Contract address: ' + res.address);
        // Let's test the deployed contract
      //  testContract(res.address);
    }
});
    }

});
//console.log(source);

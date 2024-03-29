![Ethernaut Delegation!](https://ethernaut.openzeppelin.com/imgs/BigLevel6.svg)

## Ethernaut - 6 - Delegation

Usage of ```delegatecall``` is particularly risky and has been used as an attack vector on multiple historic hacks. With it, your contract is practically saying "here, -other contract- or -other library-, do whatever you want with my state". Delegates have complete access to your contract's state. The ```delegatecall``` function is a powerful feature, but a dangerous one, and must be used with extreme care.

Please refer to the [The Parity Wallet Hack Explained](https://blog.openzeppelin.com/on-the-parity-wallet-multisig-hack-405a8c12e8f7) article for an accurate explanation of how this idea was used to steal 30M USD.

### Solution
[Contracts](./06-Delegation/Delegation.sol)

Click on "Get New Instance" to deploy the level contract on the Rinkeby network we may get started with the challenge.

From the code we can see the fallback() function of the Delegation contract can send a delegatecall to the Delegate contract, which will allow us the potential to call functions of the Delegate contract through this functionality.

Looking at the storage structure of both contracts it can be seen that the owner variable is stored in storage slot 0 in both contracts, this means that via delegatecall a change in storage slot0 of Delegate will also write to storage slot 0 of Delegation, allowing us to overwrite the owner variable.

To call a function via the lowlevel delegatecall function we must get the first 4 bytes of the sha3 hash of the function name and any variables needed for that function.

In the web console:
- web3.utils.soliditySha3("pwn()") = 0xdd365b8b15d5d78ec041b851b68c8b985bee78bee0b87c4acf261024d8beabab

Then send a transaction to the fallback function of the contract passing the player account, contract address and the 4 bytes of the sha3 hash of the function:
```solidity
    var pwnSig = web3.utils.sha3("pwn()") 
    contract.sendTransaction({data: pwnSig})
```

This will overwrite the owner variable of the Delegation contract:
- contract.owner()

Now we are the owner, we have completed the challenge, click the "Submit Instance" button and approve that transaction to complete the level.

✌(◕‿-)✌ Well done, You have completed this level!!!

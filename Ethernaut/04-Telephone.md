## Ethernaut 
### Telephone [Contracts](./04-Telephone/)

Click on "Get New Instance" to deploy the level contract on the Rinkeby network we may get started with the challenge.

Telephone has a public function to change the owner with the only protection being that msg.sender cannot be the new owner (tx.origin != msg.sender). To bypass this we create an interface of Telephone in ITelephone.sol to be able to externally interact with the Telephone contract though our own contract HackTelephone.sol

Another way to do this challenge would be to use a second account to call changeOwner() of Telephone.sol with your Ethernaut account

Using Remix IDE:
- publish ITelephone.sol and HackTelephone.sol
- call setTelephoneContract() of HackTelephone.sol with the level instance contract address
- call hackOwner() of hackTelephone.sol with your Ethereum account associated with Ethernaut

Check the contract owner with 
- contract.owner()

With the level instance contract owner now set to your Ethereum account, click the "Submit Instance" button and approve that transaction to complete the level.

✌(◕‿-)✌ Well done, You have completed this level!!!

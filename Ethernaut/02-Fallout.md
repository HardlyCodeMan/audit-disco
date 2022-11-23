## Ethernaut 
### Fallout [Contracts](./02-Fallout/Fallout.sol)

Click on "Get New Instance" to deploy the level contract on the Rinkeby network we may get started with the challenge.

Upon reading through the contract for Fallout, it its noticable that the "constructor" function is not named the same as the contract and therefore is not actually a constructor function. The function name has the number 1 instead of the lowercase letter l in the name. The Fal1out function is also payable to set the contract owner address. 

To exploit this and become the owner
- contract.Fal1out({from: player, value: "1"})

Now we're the contract owner, to retrieve the funds we sent to become owner
- contract.collectAllocations()

Once that transaction has been completed, click the "Submit Instance" button and approve that transaction to complete the level.

✌(◕‿-)✌ Well done, You have completed this level!!!

![Ethernaut Elevator!](https://ethernaut.openzeppelin.com/imgs/BigLevel11.svg)

## Ethernaut - 11 - Elevator 

You can use the ```view``` function modifier on an interface in order to prevent state modifications. The pure modifier also prevents functions from modifying the state. Make sure you read [Solidity's documentation](http://solidity.readthedocs.io/en/develop/contracts.html#view-functions) and learn its caveats.

An alternative way to solve this level is to build a view function which returns different results depends on input data but don't modify state, e.g. ```gasleft()```.

### Solution 
[Contracts](./11-Elevator/)

The Elevator contract utilises an interface for an external contract Building, however the address for the Building contract is not stored in the Elevator contract allowing potential for a malicious contract interaction. The Elevator contract assumes that the call will be made from the BUilding contract and thus sets the interface address via msg.sender, this is our way in for our malicious contract.

### Remix
Use Remix to deploy [HackElevator.sol](./11-Elevator/HackElevator.sol) **ensure** you update the vulnerable contract address.

### callElevator()
We need to call the elevator contract to set the chain of events in motion.

### isLastFloor()
We toggle a flag to keep track of the progress, returning true will set the elevator to the top floor.
```solidity
top = building.isLastFloor(floor);
```
Double check with the JS web3 console
```javascript
await contract.top()
```


Now you have sent the elevator to the top of the building, click the "Submit Instance" button and approve that transaction to complete the level.

✌(◕‿-)✌ Well done, You have completed this level!!!
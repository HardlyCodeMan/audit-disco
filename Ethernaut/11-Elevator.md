## Ethernaut 
### Elevator

The Elevator contract utilises an interface for an external contract Building, however the address for the Building contract is not stored in the Elevator contract allowing potential for a malicious contract interaction. The Elevator contract assumes that the call will be made from the BUilding contract and thus sets the interface address via msg.sender, this is our way in for our malicious contract.

### callElevator()
We need to call the elevator contract to set the chain of events in motion.

### isLastFloor()
We toggle a flag to keep track of the progress, returning true will set the elevator to the top floor.
```solidity
top = building.isLastFloor(floor);
```
Double check with the JS web3 console
```javascript
await isntance.top()
```


Now you have sent the elevator to the top of the building, click the "Submit Instance" button and approve that transaction to complete the level.

✌(◕‿-)✌ Well done, You have completed this level!!!
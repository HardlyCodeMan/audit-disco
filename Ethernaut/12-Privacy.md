![Ethernaut Privacy!](https://ethernaut.openzeppelin.com/imgs/BigLevel12.svg)

## Ethernaut - 12 - Privacy 

Nothing in the ethereum blockchain is private. The keyword private is merely an artificial construct of the Solidity language. Web3's ```getStorageAt(...)``` can be used to read anything from storage. It can be tricky to read what you want though, since several optimization rules and techniques are used to compact the storage as much as possible.

It can't get much more complicated than what was exposed in this level. For more, check out this excellent article by "Darius": [How to read Ethereum contract storage](https://medium.com/aigang-network/how-to-read-ethereum-contract-storage-44252c8af925)

### Solution

[Contracts](./12-Privacy/Privacy.sol)

While remembering that everything on the blockchain is public, we are able to retrieve storage areas of the contract in this case we want to see whats in storage for bytes32[3] private data.

| Slot | Bytes | Contract Data |
|------|-------|---------------|
| [0]  | [01]  | bool public locked = true; |
| [1]  | [32]  | uint256 public ID = block.timestamp; |
| [2]  | [01]  | uint8 private flattening = 10; |
| [2]  | [01]  | uint8 private denomination = 255; |
| [2]  | [02]  | uint16 private awkwardness = uint16(now); |
| [3-5] | [96] | bytes32[3] private data; |
| [3]  | [32]  |  - data[0] |
| [4]  | [32]  |  - data[1] |
| [5]  | [32]  |  - data[2] |     

We see ther unlock key is stored in data[2] which will be the final index of the data array with length 3, remembering the first index of an array is [0].

In the console:
- web3.eth.getStorageAt(instance, 5);
0x4ecee92a0bb65104cf270adbf7d2440c13027da2293652b7dd068fa0ad5ed453

The resultant bytes32 of hex needs to be converted to bytes16 to be accepted as _key for unlock(), we can use remix to output bytes16(0x4ecee92a0bb65104cf270adbf7d2440c13027da2293652b7dd068fa0ad5ed453), but a quicker way is to keep the first 32 bits of hex 0x4ecee92a0bb65104cf270adbf7d2440c.

All thats required now is to call unlock() in the console:
- contract.unlock('0x4ecee92a0bb65104cf270adbf7d2440c')

The contract is now unlocked, click the "Submit Instance" button and approve that transaction to complete the level.

✌(◕‿-)✌ Well done, You have completed this level!!!
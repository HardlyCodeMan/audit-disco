Challenge 6 - Graduation

To finish we need to add our name to the leaderboard. 
Reading the code we see we need to input a value that will be the same as the secret. The secret is loaded into storage with assembly.

```solidity
assembly {
    mstore(0x80, 0x636f6e67726174756c6174696f6e730000000000000000000000000000000000)
    let secret := mload(0x80)
```

All we eed to do here is throw 0x636f6e67726174756c6174696f6e730000000000000000000000000000000000 into a hex decoder like using the From Hex function of [CyberChef](https://gchq.github.io/CyberChef/#recipe=From_Hex('Auto')). From here we take the secret phrase and throw it into the [etherscan.io](https://goerli.etherscan.io/) contract interaction graduate().

Send a message to the chat window, click send and the task is complete, your name will life on the leaderboard forever.
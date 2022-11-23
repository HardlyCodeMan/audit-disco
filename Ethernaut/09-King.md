## Ethernaut 
### King [Contracts](./09-King/)

The King.sol contract has fallback function (receive()) which runs some code. Part of this code is to send the prize to the current king, set the new king address and set the new prize value. The transfer does not check for success, so we can write malicious code in a fallback receive() that would revert the transfer but still set the new king and the new prize.

#### King.sol
```solidity
...
receive() external payable {
    require(msg.value >= prize || msg.sender == owner);
    king.transfer(msg.value);
    king = msg.sender;
    prize = msg.value;
}
...
```

#### Deploy and break
- Deploy HackKing.sol with the instance contract address
- Check _king to ensure you are the new king

Now you're the king, click the "Submit Instance" button and approve that transaction to complete the level.

✌(◕‿-)✌ Well done, You have completed this level!!!
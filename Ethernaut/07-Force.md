![Ethernaut Force!](https://ethernaut.openzeppelin.com/imgs/BigLevel7.svg)

## Ethernaut - 7 - Force

In solidity, for a contract to be able to receive ether, the fallback function must be marked ```payable```.

However, there is no way to stop an attacker from sending ether to a contract by self destroying. Hence, it is important not to count on the invariant ```address(this).balance == 0``` for any contract logic.

### Solution
[Contracts](./07-Force/)

This challenge requires us to send the contract some ether but it doesn't have a receive or fall back function to be able to accept any. Soe quick seaching about fallback() and how to force send ether to a contract and came across [https://medium.com/@alexsherbuck/two-ways-to-force-ether-into-a-contract-1543c1311c56](this medium article) which states that should an external contract call selfdestruct() on istself, where the selfdestruct() function is able to accecpt a payable address to return ether to. Utilising selfdestruct() with the instance contract address as the argument, this will force the instance contract to receive gas as ether from the destruction of the contract.

With Remix:
- Run [./HackForce.sol](./07-Force/HackForce.sol) and the hack() function

Once the transaction is confirmed we have completed the challenge, click the "Submit Instance" button and approve that transaction to complete the level.

✌(◕‿-)✌ Well done, You have completed this level!!!
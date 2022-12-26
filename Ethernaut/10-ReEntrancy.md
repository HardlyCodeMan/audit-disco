![Ethernaut Re-entrancy!](https://ethernaut.openzeppelin.com/imgs/BigLevel10.svg)
## Ethernaut - 10 Re-entrancy

In order to prevent re-entrancy attacks when moving funds out of your contract, use the [Checks-Effects-Interactions](https://solidity.readthedocs.io/en/develop/security-considerations.html#use-the-checks-effects-interactions-pattern) pattern being aware that ```call``` will only return false without interrupting the execution flow. Solutions such as [ReentrancyGuard](https://docs.openzeppelin.com/contracts/4.x/api/utils#ReentrancyGuard) or [PullPayment](https://docs.openzeppelin.com/contracts/4.x/api/payment#PullPayment) can also be used.

```transfer``` and ```send``` are no longer recommended solutions as they can potentially break contracts after the Istanbul hard fork [Source 1](https://diligence.consensys.net/blog/2019/09/stop-using-soliditys-transfer-now/) [Source 2](https://forum.openzeppelin.com/t/reentrancy-after-istanbul/1742).

Always assume that the receiver of the funds you are sending can be another contract, not just a regular address. Hence, it can execute code in its payable fallback method and re-enter your contract, possibly messing up your state/logic.

Re-entrancy is a common attack. You should always be prepared for it!

### The DAO Hack

The famous DAO hack used reentrancy to extract a huge amount of ether from the victim contract. [See 15 lines of code that could have prevented TheDAO Hack](https://blog.openzeppelin.com/15-lines-of-code-that-could-have-prevented-thedao-hack-782499e00942).

### Solution [Contracts](./10-ReEntrancy/)

By utilising a low level call to the donate function sending the malicious contract address and value of ether, we are able to get the malicious contract onto the balances list.

### Remix
Use remix to deploy [HackReEntrance.sol](./10-ReEntrancy/HackReEntrance.sol) **ensure** instance address is used.

### donateToSelf()
```solidity
original.donate.value(amount).gas(1000000000000000)(address(this));
```

### withdraw()
From here it's a simple reentrance attack to have the funds siphoned to a fallback function (in this case receive()) checking the dapp balance as it goes.

### withdrawFunds() 
Drain funds from the attacker contract.

Now you have the funds from the dapp, click the "Submit Instance" button and approve that transaction to complete the level.

✌(◕‿-)✌ Well done, You have completed this level!!!
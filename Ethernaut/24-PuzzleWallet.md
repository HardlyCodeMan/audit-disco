![Ethernaut - PuzzleWallet!](https://ethernaut.openzeppelin.com/imgs/BigLevel24.svg)

## Ethernaut - 24 - Puzzle Wallet

Nowadays, paying for DeFi operations is impossible, fact.

A group of friends discovered how to slightly decrease the cost of performing multiple transactions by batching them in one transaction, so they developed a smart contract for doing this.

They needed this contract to be upgradeable in case the code contained a bug, and they also wanted to prevent people from outside the group from using it. To do so, they voted and assigned two people with special roles in the system: The admin, which has the power of updating the logic of the smart contract. The owner, which controls the whitelist of addresses allowed to use the contract. The contracts were deployed, and the group was whitelisted. Everyone cheered for their accomplishments against evil miners.

Little did they know, their lunch money was at risk…

- You'll need to hijack this wallet to become the admin of the proxy.
- Things that might help

Understanding how ```delegatecalls``` work and how ```msg.sender``` and ```msg.value``` behaves when performing one.
Knowing about proxy patterns and the way they handle storage variables.

### Solution
[Contracts](./24-PuzzleWallet/)

**NOTE: **
Modified Original Source From UpgradableProxy to ERC1697Proxy for 0.8.0 compatability

```delegatecall``` will allow us to modify storage in unexpected ways.

| Slot # | PuzzleProxy | PuzzleWallet |
|:---:|:---|:---|
| 0 | pendingAdmin | owner |
| 1 | admin | maxBalance |

To modify admin, we must change maxBalance. There are two functions that will allow this, ```init()``` and ```setMaxBalance()```.
```init()``` has already been called so we are limited with use of ```setMaxBalance()``` which requires us to be whitelisted with the ````onlyWhitelisted``` modifier, meaning we need to call ```addToWhitelist()```, which in turn requires us to be ```owner``` or overwrite ```owner``` with ```pendingAdmin```.

We are able to call ```proposeNewAdmin()``` of the proxy contract to set ```pendingAdmin``` or overwrite ```owner```.

To have all this happen, we need ```call``` which is part of the flow in ```execute()```, which has a balance check and requires us to be whitelisted. 

Another way to deposit to increase the balance is via ```multicall()```, however we can only deposit once in the ```multicall()``` flow, and we need to call deposit twice to pass the balance >= value. To bypass this limitation we can use ```multicall()``` to call ```multicall()``` giving us the two ```deposit()```s needed.

✌(◕‿-)✌ Well done, You have completed this level!!!
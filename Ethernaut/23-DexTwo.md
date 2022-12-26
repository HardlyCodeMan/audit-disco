![Ethernaut - DEexTwo!](https://ethernaut.openzeppelin.com/imgs/BigLevel23.svg)

## Ethernaut - 23 - DexTwo

This level will ask you to break DexTwo, a subtlely modified Dex contract from the previous level, in a different way.

You need to drain all balances of token1 and token2 from the DexTwo contract to succeed in this level.

You will still start with 10 tokens of token1 and 10 of token2. The DEX contract still starts with 100 of each token.

Things that might help:
- How has the swap method been modified?

### Solution
[Contracts](./23-DexTwo/)

Dex.sol
```
    require((from == token1 && to == token2) || (from == token2 && to == token1), "Invalid tokens");
    require(IERC20(from).balanceOf(msg.sender) >= amount, "Not enough to swap");
    uint swapAmount = getSwapPrice(from, to, amount);
```
DexTwo.sol
```
    require(IERC20(from).balanceOf(msg.sender) >= amount, "Not enough to swap");
    uint swapAmount = getSwapPrice(from, to, amount);
```

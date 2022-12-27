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

The missing line:
```require((from == token1 && to == token2) || (from == token2 && to == token1), "Invalid tokens");```
checks that the tokens the user would liek to swap are only from these two approved addresses. 

With this check missing in DexTwo, we can create out own ERC20 compatible token with Openzeppelins boilerplate ERC20, and utilise it in the swap process to drain the legitimate token funds.

Once the ERC20 token is created and minted 400 to the attacker, the attacker must set an approval for themselves (100) and the dex (300), then 100 tokens are sent to the dex to prevent ```getSwapAmount()``` reverting with a ```divide by 0``` error if the dex balance of the token is 0 during the ```swap()```.

Then obviously the swap is run and the instance can be submitted.

✌(◕‿-)✌ Well done, You have completed this level!!!
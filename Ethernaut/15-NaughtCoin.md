![Ethernaut - Naught Coin!](https://ethernaut.openzeppelin.com/imgs/BigLevel15.svg)

## Ethernaut - 15 - Naught Coin

When using code that's not your own, it's a good idea to familiarize yourself with it to get a good understanding of how everything fits together. This can be particularly important when there are multiple levels of imports (your imports have imports) or when you are implementing authorization controls, e.g. when you're allowing or disallowing people from doing things. In this example, a developer might scan through the code and think that ```transfer``` is the only way to move tokens around, low and behold there are other ways of performing the same operation with a different implementation.

### Solution
[Contracts](./15-NaughtCoin/)

		this.approve(address(this), INITIAL_SUPPLY);

		this.transferFrom(player, address(this), INITIAL_SUPPLY);


        contract.approve(player, INITIAL_SUPPLY);
        contract.transferFrom(player, contract, INITIAL_SUPPLY);
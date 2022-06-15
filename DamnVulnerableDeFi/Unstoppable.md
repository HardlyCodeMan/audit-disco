# Unstoppable #
The goal of the Unstoppable challenge is to attack the pool in such a way that flash loans will not be able to be executed past the attack transaction.

*UnstoppableLender.sol* utilises *transferFrom()* inherited from *IERC20.sol* in the *depositTokens()* function to handle token deposits into the contract and to keep track of the contract tokenbalance for the pool with variable *poolBalance*. It should be rememberd that the contract uses the ERC20 token standard from OpenZeppelin *IERC20.sol* which has another transfer function *transfer()* which is inherited with the contract. We now have establised the contract has two ways to alter the token balance of the contract *damnValuableToken.balanceOf(address(this)* but only one is being utilised to update the internal variable tracking the contract token balance poolBalance.

The *flashLoan()* function sets variable balanceBefore directly from the contract balance *uint256 balanceBefore = damnValuableToken.balanceOf(address(this))* and has an assertion that *poolBalance == balanceBefore* otherwise the contract will revert if false being the nature of an assertion.

So the attack vector is to modify the contract token balance in a way such that the poolBalance variable is not updated thus making the *poolBalance == balanceBefore* assertion fail. This can be achieved with the use of the *transfer()* function from IERC20.sol.

```
it('Exploit', async function () {
    /** CODE YOUR EXPLOIT HERE */// The ERC20 contract default transfer() function will execute without updating the local

    // value of poolBalance only updated with depositTokens()
    await this.token.transfer(this.pool.address, 1, { from: attacker });`
});
```

**NOTE**: I was having an issue with hardhat relating to getsigners(). To fix for this challenge *const* was added prior to the line setting the account names.
`const [deployer, attacker, someUser] = await ethers.getSigners();

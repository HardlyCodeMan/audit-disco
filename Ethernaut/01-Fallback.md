![Ethernaut - Fallback!](https://ethernaut.openzeppelin.com/imgs/BigLevel1.svg)

## Ethernaut - 1 - Fallback

You know the basics of how ether goes in and out of contracts, including the usage of the fallback method.

You've also learnt about OpenZeppelin's Ownable contract, and how it can be used to restrict the usage of some methods to a privileged address.

Move on to the next level when you're ready!

### Solution

Click on "Get New Instance" to deploy the level contract on the Rinkeby network we may get started with the challenge.

This level requires us to:
1. Claim ownership of the contract
2. Reduce its balance to 0

Looking at the contract code, the receive function will overwrite the owner variable when some Eth is sent.

The contribute() function has require(msg.value < 0.001 ether) otherwise the transaction will fail, so we call:
- contract.contribute({value: toWei("0.0001")})

We can check our contribution made to the list of contributers:
- contract.contributions(player)

Contracts can have a fallback function for a purpose like rejecting any deposit made to the contract outside of the contract functions the developer wants users to utilise. The fallback function of this contract however (receive()) allows for the change of the owner variable which in turn allows that account to access contract functions normally protected by the onlyOwner modifier.

Now to set the owner variable to our account by sending some ether to the contract to run the receive() function
- contract.sendTransaction({from: player, value: toWei("0.0001")})

We can confirm we are the owner:
- contract.owner()

From here our address is now owner so we can empty the contract balance with withdraw()
- contract.withdraw()

Once that transaction has been completed, click the "Submit Instance" button and approve that transaction to complete the level.

✌(◕‿-)✌ Well done, You have completed this level!!!

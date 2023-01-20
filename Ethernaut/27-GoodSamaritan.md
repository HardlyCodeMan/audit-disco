![Ethernaut - Good Samaritan!](https://ethernaut.openzeppelin.com/imgs/BigLevel27.png)

## Ethernaut - 27 - Good Samaritan
This instance represents a Good Samaritan that is wealthy and ready to donate some coins to anyone requesting it.

Would you be able to drain all the balance from his Wallet?

Things that might help:

[Solidity Custom Errors](https://blog.soliditylang.org/2021/04/21/custom-errors/)

### Solution
[Contracts](./27-GoodSamaritan/src/)

While custom errors save on deployment gas costs, they can be used maliciously in this case.

```requestDonation()``` checks for the custom error ```NotEnoughBalance()``` which in the normal course of events will come from the within the contracts own workflow shoud there be a ```requestDonation()``` with less than 10 coins remaining, alowing a donation to still be transferred.

There is a check to see if the recipient is a contract, should it ne a contract it'll call a ```notify()``` function.

Utilising these two pieces of information, our attack contract will call ```requestDonation()```, and catch the follow-up call to ```notify()```, responding with the custom error ```NotEnoughBalance()```. This will force the GoodSamaritan to call ```transferRemainder()```, transferring the entire balance to our attack contract.

Now you have all the funds of the GoodSamaritan, click the "Submit Instance" button and approve that transaction to complete the level.

✌(◕‿-)✌ Well done, You have completed this level!!!
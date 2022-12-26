![Ethernaut Vault!](https://ethernaut.openzeppelin.com/imgs/BigLevel8.svg)

## Ethernaut - 8 - Vault

It's important to remember that marking a variable as private only prevents other contracts from accessing it. State variables marked as private and local variables are still publicly accessible.

To ensure that data is private, it needs to be encrypted before being put onto the blockchain. In this scenario, the decryption key should never be sent on-chain, as it will then be visible to anyone who looks for it. [zk-SNARKs](https://blog.ethereum.org/2016/12/05/zksnarks-in-a-nutshell/) provide a way to determine whether someone possesses a secret parameter, without ever having to reveal the parameter.

### Solution
[Contracts](./08-Vault/Vault.sol)

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
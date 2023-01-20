![Ethernaut - Double Entry Point!](https://ethernaut.openzeppelin.com/imgs/BigLevel26.svg)

## Ethernaut - 26 - Double Entry Point
powered by [Forta](https://forta.org/)

This level features a ```CryptoVault``` with special functionality, the ```sweepToken``` function. This is a common function used to retrieve tokens stuck in a contract. The ```CryptoVault``` operates with an ```underlying``` token that can't be swept, as it is an important core logic component of the ```CryptoVault```. Any other tokens can be swept.

The underlying token is an instance of the DET token implemented in the ```DoubleEntryPoint``` contract definition and the ```CryptoVault``` holds 100 units of it. Additionally the ```CryptoVault``` also holds 100 of ```LegacyToken LGT```.

In this level you should figure out where the bug is in ```CryptoVault``` and protect it from being drained out of tokens.

The contract features a ```Forta``` contract where any user can register its own ```detection bot``` contract. Forta is a decentralized, community-based monitoring network to detect threats and anomalies on DeFi, NFT, governance, bridges and other Web3 systems as quickly as possible. Your job is to implement a ```detection bot``` and register it in the ```Forta``` contract. The bot's implementation will need to raise correct alerts to prevent potential attacks or bug exploits.

Things that might help:

- How does a double entry point work for a token contract?

### Solution
[Contracts](./26-DoubleEntryPoint/src/)
[Scripts](./26-DoubleEntryPoint/script/)

#### The Attack
The attack is simplified to ```cryptoVault.sweepToken(legacyToken)```.

Having legacyToken override ```transfer()``` with ```delegateTransfer()``` if the delegate is set, so will utilise ```msg.sender``` which will be CryptoVault as the _from address in ```_transfer()``` of IERC20.

#### The Mitigation
We need to create a detection bot to intereact with Forta which has the function ```handleTransaction()``` to check if the sender is the vault, we raise an alert ```raiseAlert()``` to prevent the malicious transaction.

To do this we need to retrieve the embedded ```msg.sender``` address from the second layer of calldata and check it against the CryptoVault address, raising an alert should the call originate at the CryptoVault.

We want the second layer of calldata, as the first layer of calldata will be calling our ```handleTransaftion()``` function.

✌(◕‿-)✌ Well done, You have completed this level!!!
![Ethernaut Telephone!](https://ethernaut.openzeppelin.com/imgs/BigLevel4.svg)

## Ethernaut - 4 - Telephone

While this example may be simple, confusing ```tx.origin``` with ```msg.sender``` can lead to phishing-style attacks, such as [this](https://blog.ethereum.org/2016/06/24/security-alert-smart-contract-wallets-created-in-frontier-are-vulnerable-to-phishing-attacks/).

An example of a possible attack is outlined below.

Use ```tx.origin``` to determine whose tokens to transfer, e.g.
```
function transfer(address _to, uint _value) {
  tokens[tx.origin] -= _value;
  tokens[_to] += _value;
}
```
Attacker gets victim to send funds to a malicious contract that calls the transfer function of the token contract, e.g.
```
function () payable {
  token.transfer(attackerAddress, 10000);
}
```
In this scenario, ```tx.origin``` will be the victim's address (while ```msg.sender``` will be the malicious contract's address), resulting in the funds being transferred from the victim to the attacker.

### Solution
[Contracts](./04-Telephone/)

Click on "Get New Instance" to deploy the level contract on the Rinkeby network we may get started with the challenge.

Telephone has a public function to change the owner with the only protection being that msg.sender cannot be the new owner (tx.origin != msg.sender). To bypass this we create an interface of Telephone in ITelephone.sol to be able to externally interact with the Telephone contract though our own contract HackTelephone.sol

Another way to do this challenge would be to use a second account to call changeOwner() of Telephone.sol with your Ethernaut account

Using Remix IDE:
- publish ITelephone.sol and HackTelephone.sol
- call setTelephoneContract() of HackTelephone.sol with the level instance contract address
- call hackOwner() of hackTelephone.sol with your Ethereum account associated with Ethernaut

Check the contract owner with 
- contract.owner()

With the level instance contract owner now set to your Ethereum account, click the "Submit Instance" button and approve that transaction to complete the level.

✌(◕‿-)✌ Well done, You have completed this level!!!

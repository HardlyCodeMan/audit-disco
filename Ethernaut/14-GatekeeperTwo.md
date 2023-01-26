![Ethernaut Gatekeeper Two!](https://ethernaut.openzeppelin.com/imgs/BigLevel14.svg)

## Ethernaut - 14 - GatekeeperTwo 

This gatekeeper introduces a few new challenges. Register as an entrant to pass this level.

Things that might help:
- Remember what you've learned from getting past the first gatekeeper - the first gate is the same.
- The ```assembly``` keyword in the second gate allows a contract to access functionality that is not native to vanilla Solidity. See [here](http://solidity.readthedocs.io/en/v0.8.17/assembly.html) for more information. The ```extcodesize``` call in this gate will get the size of a contract's code at a given address - you can learn more about how and when this is set in section 7 of the [yellow paper](https://ethereum.github.io/yellowpaper/paper.pdf).
- The ```^``` character in the third gate is a bitwise operation (XOR), and is used here to apply another common bitwise operation (see [here](http://solidity.readthedocs.io/en/v0.8.17/miscellaneous.html#cheatsheet)). The Coin Flip level is also a good place to start when approaching this challenge.

### Solution
[Contracts](./14-GatekeeperTwo/)

GatekeeperTwo follows on from [GatekeeperOne](./13-GatekeeperOne.md), in that there are 3 function modifiers that must have their requirements met to become ```entrant```, completing the challenge.

```gateOne()``` Requires the call to come from an account other than msg.sender ie. from a contract.

```gateTwo()``` Requires the call to come from an account with a code size of 0, which could be either an EOA (normal wallet account) or from a contract during the constructor phase of deployment, as making calls from the constructor (while it's being deployed), ensures ```extcodesize``` = 0

```gateThree()``` The [solidity docs](http://solidity.readthedocs.io/en/v0.8.17/miscellaneous.html#cheatsheet) list the ```^``` character as the implementation of an ```XOR``` (exclusive or) operation. 
Given the following equation ```a ^ b = c``` it can be translated to english that either a or b can equal c but not both. Therefore we can logically translate the equation to ```a ^ c = b```, or a or c can equal b but not both.


The contract is now unlocked, click the "Submit Instance" button and approve that transaction to complete the level.

✌(◕‿-)✌ Well done, You have completed this level!!!
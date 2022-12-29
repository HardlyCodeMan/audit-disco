![Ethernaut - Motorbike!](https://ethernaut.openzeppelin.com/imgs/BigLevel25.svg)

## Ethernaut - 25 - Motorbike

Ethernaut's motorbike has a brand new upgradeable engine design.

Would you be able to ```selfdestruct``` its engine and make the motorbike unusable ?

Things that might help:

- [EIP-1967](https://eips.ethereum.org/EIPS/eip-1967)
- [UUPS](https://forum.openzeppelin.com/t/uups-proxies-tutorial-solidity-javascript/7786) upgradeable pattern
- [Initializable](https://github.com/OpenZeppelin/openzeppelin-upgrades/blob/master/packages/core/contracts/Initializable.sol) contract

### Solution
[Contracts](./25-Motorbike/)

**Note :**
Requires [Openzeppelin-contracts @ 3.4.0](https://github.com/OpenZeppelin/openzeppelin-contracts/blob/release-v3.4/) for solidity < 0.7.0

Understanding the EIP-1967 implementation is key here, while Engines ```initialize()``` is called in the ```constructor()```, it is called via ```delagatecall()``` meaning that ```upgrader``` is not stored on in slot0 of Engine, but instead written to slot0 of Motorbike. Meaning that for the logic checks of Engine, the contract will be un-initialised.

So we can manually call ```initialize()``` and become ```upgrader```, leading us to the ability to create a malicious contract to call ```selfdestruct()``` rendering Engine destroyed and Motorbike unusable.

**Note :**
[EIP-4758](https://eips.ethereum.org/EIPS/eip-4758) Infers ```selfdestruct()``` may become deprecated in the future now we are past "The Merge" and moving towards statelessness.

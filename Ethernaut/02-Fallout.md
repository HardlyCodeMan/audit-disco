![Ethernaut - Fallout!](https://ethernaut.openzeppelin.com/imgs/BigLevel2.svg)

## Ethernaut - 2 - Fallout

That was silly wasn't it? Real world contracts must be much more secure than this and so must it be much harder to hack them right?

Well... Not quite.

The story of Rubixi is a very well known case in the Ethereum ecosystem. The company changed its name from 'Dynamic Pyramid' to 'Rubixi' but somehow they didn't rename the constructor method of its contract:
```
contract Rubixi {
  address private owner;
  function DynamicPyramid() { owner = msg.sender; }
  function collectAllFees() { owner.transfer(this.balance) }
  ...
```
This allowed the attacker to call the old constructor and claim ownership of the contract, and steal some funds. Yep. Big mistakes can be made in smartcontractland.

### Solution
[Contracts](./02-Fallout/)

Click on "Get New Instance" to deploy the level contract on the Rinkeby network we may get started with the challenge.

Upon reading through the contract for Fallout, it its noticable that the "constructor" function is not named the same as the contract and therefore is not actually a constructor function. The function name has the number 1 instead of the lowercase letter l in the name. The Fal1out function is also payable to set the contract owner address. 

To exploit this and become the owner
- contract.Fal1out({from: player, value: "1"})

Now we're the contract owner, to retrieve the funds we sent to become owner
- contract.collectAllocations()

Once that transaction has been completed, click the "Submit Instance" button and approve that transaction to complete the level.

✌(◕‿-)✌ Well done, You have completed this level!!!

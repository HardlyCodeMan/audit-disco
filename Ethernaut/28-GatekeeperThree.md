![Ethernaut Gatekeeper Three!](https://ethernaut.openzeppelin.com/imgs/BigLevel28.svg)

## Ethernaut - 28 - GatekeeperThree 

Cope with gates and become an entrant.

Things that might help:
- Recall return values of low-level functions.
- Be attentive with semantic.
- Refresh how storage works in Ethereum.

### Solution
[Contracts](./28-GatekeeperThree/)


gateOne() require(msg.sender == owner); require(tx.origin != owner);
owner -> construct0r()

gateTwo() require(allow_enterance == true);
getAllowance -> trick.checkPassword(_password)

cast send --rpc-url $GOERLI_OPTIMISIM_RPC --private-key $ETHERNAUT_PRIVATE_KEY 0xFa5Ff60674ae929aeB4195b00775BBe0886df5FF "createTrick()"
cast block --rpc-url $GOERLI_OPTIMISIM_RPC "<block number>"

gateThree() (address(this).balance > 0.001 ether && payable(owner).send(0.001 ether) == false)
receive() external payable { revert; }

✌(◕‿-)✌ Well done, You have completed this level!!!
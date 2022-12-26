![Ethernaut - Alien Codex!](https://ethernaut.openzeppelin.com/imgs/BigLevel19.svg)

## Ethernaut - 19 - Alien Codex

This level exploits the fact that the EVM doesn't validate an array's ABI-encoded length vs its actual payload.

Additionally, it exploits the arithmetic underflow of array length, by expanding the array's bounds to the entire storage area of 2^256. The user is then able to modify all contract storage.

Both vulnerabilities are inspired by 2017's [Underhanded coding contest](https://medium.com/@weka/announcing-the-winners-of-the-first-underhanded-solidity-coding-contest-282563a87079)

### Solution
[Contracts](./19-AlienCodex/)

contract.contact()
    false
contract.make_contact()
contract.contact()
    true


https://blog.dixitaditya.com/ethernaut-level-19-alien-codex
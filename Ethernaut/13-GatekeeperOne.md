## Ethernaut 
### GatekeeperOne


GateOne:
```solidity
    modifier gateOne() {
        require(msg.sender != tx.origin);
        _;
    }
```
To pass this gate we must use an intermediary contract so Wallet Account (EOA) = tx.origin and Contract Account (CA) = msg.sender.

GateTwo:
```solidity
    modifier gateTwo() {
        require(gasleft().mod(8191) == 0);
        _;
    }
```
To pass this gate...

GateThree:
```solidity
    modifier gateThree(bytes8 _gateKey) {
        require(uint32(uint64(_gateKey)) == uint16(uint64(_gateKey)), "GatekeeperOne: invalid gateThree part one");
        require(uint32(uint64(_gateKey)) != uint64(_gateKey), "GatekeeperOne: invalid gateThree part two");
        require(uint32(uint64(_gateKey)) == uint16(tx.origin), "GatekeeperOne: invalid gateThree part three");
        _;
    }
```
To pass gate 3 a mask is requred as a form of data integrity to pass the 3 checks

0x11111111 == 0x1111, which is only possible if the value is masked by 0x0000FFFF
0x1111111100001111 != 0x00001111, which is only possible if you keep the preceding values, with the mask 0xFFFFFFFF0000FFFF

bytes8 key = bytes8(tx.origin) & 0xFFFFFFFF0000FFFF;

Solidity 0.8.0 introduced breaking changes to disallows expicit type conversion from address to bytes8

bytes8 key = bytes8(bytes20(address(this))) & 0xFFFFFFFF0000FFFF;

The contract is now unlocked, click the "Submit Instance" button and approve that transaction to complete the level.

✌(◕‿-)✌ Well done, You have completed this level!!!
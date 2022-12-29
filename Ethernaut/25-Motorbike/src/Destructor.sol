//SPDX-License-Identifier: UNLICENSED
pragma solidity 0.6.12;

contract Destructor {
    function destruct() external {
        selfdestruct(msg.sender);
    }
}
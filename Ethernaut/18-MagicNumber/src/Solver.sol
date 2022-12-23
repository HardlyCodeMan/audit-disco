//SPDX-License-Identifier:Unlicensed
pragma solidity 0.8.17;

import "./MagicNumber.sol";

contract Solver {
    MagicNum public magicnum = MagicNum(0xaBbAdC0bf9e5972c585c0c09c7d83f282476f21b);

    function hack() public returns(address) {
        // bytecode 600a600c600039600a6000f3602a60805260206080f3
        bytes memory code = "\x60\x0a\x60\x0c\x60\x00\x39\x60\x0a\x60\x00\xf3\x60\x2a\x60\x80\x52\x60\x20\x60\x80\xf3";
        address solver;

        assembly {
            solver := create(0, add(code, 0x20), mload(code))
        }
        
        magicnum.setSolver(solver);

        return solver;
    }
}
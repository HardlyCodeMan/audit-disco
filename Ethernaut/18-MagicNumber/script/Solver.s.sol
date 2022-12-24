// SPDX-License-Identifier: UNLICENSED
// Foundry Deployment Script
// Load .env Environment Variables: source ../../.env
// Forge Command: 
// forge script script/Solver.s.sol --private-key $ETHERNAUGHT_PRIVATE_KEY --broadcast --rpc-url $GORELI_OPTIMISIM_RPC -vvvv

pragma solidity 0.8.17;

import "forge-std/Script.sol";
import "../src/MagicNumber.sol";

contract Solver is Script {

    MagicNum magicnum = MagicNum(0xaBbAdC0bf9e5972c585c0c09c7d83f282476f21b);
    function run() external{
        vm.startBroadcast();
        
        bytes memory code = "\x60\x0a\x60\x0c\x60\x00\x39\x60\x0a\x60\x00\xf3\x60\x2a\x60\x80\x52\x60\x20\x60\x80\xf3";
        
        address solver;

        assembly {
            solver := create(0, add(code, 0x20), mload(code))
        }
        
        magicnum.setSolver(solver);
        vm.stopBroadcast();
    }
}
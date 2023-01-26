// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.17;

import "forge-std/Script.sol";
import "../src/HackGates.sol";

contract OpenGates is Script {
    address public player = 0x8656D273630865bB4887E00d86a338A214Ac4b50;

    function run() public {
        vm.startBroadcast(player);

        HackGates hack = new HackGates();
        GatekeeperTwo gates = hack.gates();

        require(gates.entrant() == player, "Player is not entrant.");

        vm.stopBroadcast();
    }
}
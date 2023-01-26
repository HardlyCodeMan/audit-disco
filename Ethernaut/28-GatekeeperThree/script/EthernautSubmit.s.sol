//SPDX-License-Identifier:UNLICENSED
pragma solidity 0.8.17;

import "forge-std/Script.sol";
import "./OpenGates.s.sol";
import "../src/EthernautFactory.sol";

contract EthernautSubmit is Script {
    Ethernaut ethernaut = Ethernaut(0xB4802b28895ec64406e45dB504149bfE79A38A57);
    OpenGates openGates = new OpenGates();
    address player = 0x8656D273630865bB4887E00d86a338A214Ac4b50;
    address _instance = 0xFa5Ff60674ae929aeB4195b00775BBe0886df5FF;

    function run() public {
        vm.label(address(ethernaut), "Ethernaut");
        vm.label(address(openGates), "OpenGates");
        vm.label(player, "Player");
        vm.label(_instance, "Instance");
        
        vm.startBroadcast(player);
        openGates.run();
        ethernaut.submitLevelInstance(payable(_instance));
        vm.stopBroadcast();
    }
}

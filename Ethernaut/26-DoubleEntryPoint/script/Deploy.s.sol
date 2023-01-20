//SPDX-License-Identifier: Unlicensed
pragma solidity 0.8.17;

import "forge-std/Script.sol";
import "../src/DoubleEntryPoint.sol";
import "../src/DetectionBot.sol";

contract DeployHackDoubleEntryPoint is Script {
    address player = <player address>;

    DoubleEntryPoint doubleEntryPointToken = DoubleEntryPoint(<level contract address>);
    CryptoVault cryptoVault = CryptoVault(doubleEntryPointToken.cryptoVault());
    Forta forta = Forta(doubleEntryPointToken.forta());
    DetectionBot detectionBot = new DetectionBot(address(cryptoVault));

    function run() public {
        vm.startBroadcast(player);
            // the mitigation
            forta.setDetectionBot(address(detectionBot));
        vm.stopBroadcast();
    }
}
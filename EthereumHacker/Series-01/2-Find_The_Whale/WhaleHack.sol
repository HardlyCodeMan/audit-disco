//SPDX-License-Identifier: MIT
pragma solidity 0.8.13;

import "@openzeppelin/contracts/token/ERC721/IERC721.sol";

contract WhaleHack {
    function hack(uint _id) public view returns (address) {
        return IERC721(0x484Ec30Feff505b545Ed7b905bc25a6a40589181).ownerOf(_id);
    }
}
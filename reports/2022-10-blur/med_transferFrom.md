## 2022 10 Blur
### Medium Findings

## Token transfers do not verify that the tokens were successfully transferred

## Impact
Some tokens don't revert the transaction when the transfer/transferFrom fails and returns false, which then requires a check of the return value of the function. While Blur seems to currently on be dealing with WETH (ERC20) future upgrades may implement token(s) which are not security compliant.

## Proof of Concept
[ExecutionDelegate.sol#L119-L126](https://github.com/code-423n4/2022-10-blur/blob/2fdaa6e13b544c8c11d1c022a575f16c3a72e3bf/contracts/ExecutionDelegate.sol#L119-L126)

```solidity
    function transferERC20(address token, address from, address to, uint256 amount)
        approvedContract
        external
        returns (bool)
    {
        require(revokedApproval[from] == false, "User has revoked approval");
        return IERC20(token).transferFrom(from, to, amount);
    }
```

## Tools Used
VSCode

## Recommended Mitigation Steps
Utilise the OZ SafeERC20 contract and its safeTransfer / safeTransferFrom functions.
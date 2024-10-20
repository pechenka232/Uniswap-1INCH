// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@aave/core-v3/contracts/flashloan/base/FlashLoanReceiverBase.sol";
import "@aave/core-v3/contracts/interfaces/IPoolAddressesProvider.sol";
import "@openzeppelin/contracts/token/ERC20/IERC20.sol";

contract FlashLoanExample is FlashLoanReceiverBase {
    address private owner;

    constructor(IPoolAddressesProvider _addressProvider) FlashLoanReceiverBase(_addressProvider) {
        owner = msg.sender;
    }

    function executeOperation(
        address[] calldata assets,
        uint256[] calldata amounts,
        uint256[] calldata premiums,
        address initiator,
        bytes calldata params
    ) external override returns (bool) {
        
        for (uint i = 0; i < assets.length; i++) {
            uint amountOwing = amounts[i] + premiums[i];
            IERC20(assets[i]).approve(address(POOL), amountOwing);
        }
        return true;
    }

    function requestFlashLoan(address asset, uint256 amount) external {
        address;
        assets[0] = asset;

        uint256;
        amounts[0] = amount;

        uint256;
        modes[0] = 0; // No debt mode

        POOL.flashLoan(address(this), assets, amounts, modes, address(this), "", 0);
    }
}

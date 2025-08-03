// SPDX-License-Identifier: MIT
pragma solidity ^0.8;

import {IERC20} from "./interfaces/IERC20.sol";
import {IUniswapV2Router} from "./interfaces/UniswapV2.sol";

contract ASwapV2 {
    // address of the uniswap v2 router
    address private constant UNISWAP_V2_ROUTER = 0xD99D1c33F9fC3444f8101754aBC46c52416550D1;

    // ABNB 0x4a46B5B96FA7767370281Ba469dfd5Ff59c96Ec0
    // AUSDT 0x3e783B3c703F13f79A236632021d92e6F7b39dE8
    // 1 1000000000000000000

    // swap function
    function swap(
        address _tokenIn,
        address _tokenOut,
        uint256 _amountIn
    ) external {
        require(_amountIn > 0, "Amount in must be greater than 0");
        // transfer the amount in tokens from msg.sender to this contract
        bool success = IERC20(_tokenIn).transferFrom(
            msg.sender,
            address(this),
            _amountIn
        );
        require(success, "TokenIn transfer failed");

        // by calling IERC20 approve you allow the uniswap contract to spend the tokens in this contract
        IERC20(_tokenIn).approve(UNISWAP_V2_ROUTER, _amountIn);

        address[] memory path;
        path = new address[](2);
        path[0] = _tokenIn;
        path[1] = _tokenOut;

        uint256[] memory amountsExpected = IUniswapV2Router(UNISWAP_V2_ROUTER)
            .getAmountsOut(_amountIn, path);

        uint256 _deadline = block.timestamp + 2 * 60;

        IUniswapV2Router(UNISWAP_V2_ROUTER).swapExactTokensForTokens(
            _amountIn,
            (amountsExpected[1] * 990) / 1000, // accpeting a slippage of 1%
            path,
            msg.sender,
            _deadline
        );
    }
}

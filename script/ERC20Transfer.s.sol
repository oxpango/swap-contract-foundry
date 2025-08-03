// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "forge-std/Script.sol";

interface IERC20 {
    function transfer(address to, uint256 amount) external returns (bool);

    function balanceOf(address account) external view returns (uint256);
}

contract ERC20TransferScript is Script {
    IERC20 token;
    address tokenAddress = 0x4a46B5B96FA7767370281Ba469dfd5Ff59c96Ec0;
    address sender;
    uint256 privateKey;

    function setUp() public {
        vm.createSelectFork(vm.envString("BSC_TESTNET_RPC_URL"));

        privateKey = vm.envUint("PRIVATE_KEY");

        sender = vm.addr(privateKey);
        console.log("Sender address:", sender);

        token = IERC20(tokenAddress);

        uint256 balance = token.balanceOf(sender);
        console.log("Sender balance:", balance);
        require(balance > 0, "Sender has no tokens");
    }

    function run() public {
        address recipient = 0xb095fDF928C74d1f426A9118e649da2b75f0982a;
        uint256 amount = 10 * 1e18;

        uint256 senderBalanceBefore = token.balanceOf(sender);
        uint256 recipientBalanceBefore = token.balanceOf(recipient);
        console.log("Sender balance before:", senderBalanceBefore);
        console.log("Recipient balance before:", recipientBalanceBefore);

        vm.startBroadcast(privateKey);

        bool success = token.transfer(recipient, amount);
        console.log("Transfer", success);

        vm.stopBroadcast();

        // 验证余额变化
        uint256 senderBalanceAfter = token.balanceOf(sender);
        uint256 recipientBalanceAfter = token.balanceOf(recipient);
        console.log("Sender balance after:", senderBalanceAfter);
        console.log("Recipient balance after:", recipientBalanceAfter);
    }
}

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "forge-std/Script.sol";

interface IERC20 {
    function transfer(address to, uint256 amount) external returns (bool);
}

contract TransferScript is Script {
    uint256 privateKey;

    function setUp() public {
        vm.createSelectFork(vm.envString("CHAIN_NODE"));

        privateKey = vm.envUint("PRIVATE_KEY");
        address sender = vm.addr(privateKey);
        console.log("Sender address:", sender);
    }

    function run() external {
        address tokenAddress = 0x4a46B5B96FA7767370281Ba469dfd5Ff59c96Ec0;
        address recipient = 0xb095fDF928C74d1f426A9118e649da2b75f0982a;
        uint256 amount = 10 * 1e18; // 10 代币

        vm.startBroadcast(privateKey);

        IERC20(tokenAddress).transfer(recipient, amount);

        vm.stopBroadcast();
    }
}

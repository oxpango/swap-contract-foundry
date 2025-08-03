// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Script, console} from "forge-std/Script.sol";
import {IERC20Metadata} from "@openzeppelin/contracts/token/ERC20/extensions/IERC20Metadata.sol";
import {ASwapV2} from "../src/ASwapV2.sol";

contract SwapScript is Script {
    IERC20Metadata public bnb;

    ASwapV2 public aswapv2;

    uint256 privateKey;

    address owner;
    address bnbAddress = 0x4a46B5B96FA7767370281Ba469dfd5Ff59c96Ec0;
    address swapAddress = 0x2E70b8d4b4dD88F6bA95dC246035217e8292CFEE;
    address usdtAddress = 0x3e783B3c703F13f79A236632021d92e6F7b39dE8;

    function setUp() public {
        vm.createSelectFork(vm.envString("CHAIN_NODE"));
        bnb = IERC20Metadata(bnbAddress);
        aswapv2 = ASwapV2(swapAddress);

        privateKey = vm.envUint("PRIVATE_KEY");
        owner = vm.addr(privateKey);
        console.log("owner Address:", owner);
    }

    function run() public {
        string memory name = bnb.name();
        console.log("name:", name);

        vm.startBroadcast(privateKey);

        console.log("owner:", owner);

        if (bnb.allowance(owner, swapAddress) == 0) {
            bnb.approve(swapAddress, 200000000000000000000000000);
            console.log("Approved swap contract to spend BNB tokens");
        } else {
            console.log("Swap contract already has allowance to spend BNB tokens");
        }

        aswapv2.swap(bnbAddress, usdtAddress, 1000000000000000000);
        console.log("Swap executed: 1 BNB to USDT");

        vm.stopBroadcast();
    }
}

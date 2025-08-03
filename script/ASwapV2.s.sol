// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Script, console} from "forge-std/Script.sol";
import {ASwapV2} from "../src/ASwapV2.sol";

contract ASwapV2Script is Script {
    ASwapV2 public swap;

    function setUp() public {}

    function run() public {
        vm.createSelectFork(vm.envString("CHAIN_NODE"));

        uint256 deployerPrivateKey = vm.envUint("PRIVATE_KEY");
        vm.startBroadcast(deployerPrivateKey);

        swap = new ASwapV2();
        vm.stopBroadcast();
    }
}

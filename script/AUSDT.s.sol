// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Script} from "forge-std/Script.sol";
import {AUSDT} from "../src/AUSDT.sol";

contract AUSDTScript is Script {
    AUSDT public usdt;

    function setUp() public {}

    function run() public {
        vm.createSelectFork(vm.envString("CHAIN_NODE"));

        uint256 deployerPrivateKey = vm.envUint("PRIVATE_KEY");
        vm.startBroadcast(deployerPrivateKey);

        usdt = new AUSDT();
        vm.stopBroadcast();
    }
}

// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Script} from "forge-std/Script.sol";
import {AMAX} from "../src/AMAX.sol";

contract AMAXScript is Script {
    AMAX public amax;

    function setUp() public {}

    function run() public {
        vm.createSelectFork(vm.envString("CHAIN_NODE"));

        uint256 deployerPrivateKey = vm.envUint("PRIVATE_KEY");
        vm.startBroadcast(deployerPrivateKey);

        amax = new AMAX();
        vm.stopBroadcast();
    }
}

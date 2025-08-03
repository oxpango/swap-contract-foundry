// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Script, console} from "forge-std/Script.sol";
import {ABNB} from "../src/ABNB.sol";

contract ABNBScript is Script {
    ABNB public bnb;

    function setUp() public {}

    function run() public {
        vm.createSelectFork(vm.envString("CHAIN_NODE"));

        uint256 deployerPrivateKey = vm.envUint("PRIVATE_KEY");
        vm.startBroadcast(deployerPrivateKey);

        bnb = new ABNB();
        vm.stopBroadcast();
    }
}

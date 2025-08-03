// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test, console} from "forge-std/Test.sol";
import {IERC20Metadata} from "@openzeppelin/contracts/token/ERC20/extensions/IERC20Metadata.sol";

contract BNBTest is Test {
    IERC20Metadata public bnb;

    address owner;
    address bnbAddress = 0x4a46B5B96FA7767370281Ba469dfd5Ff59c96Ec0;
    address swapAddress = 0x2E70b8d4b4dD88F6bA95dC246035217e8292CFEE;

    function setUp() public {
        vm.createSelectFork(vm.envString("CHAIN_NODE"));
        bnb = IERC20Metadata(bnbAddress);

        string memory privateKeyHex = vm.envString("PRIVATE_KEY");
        uint256 privateKey = vm.parseUint(string(privateKeyHex));
        owner = vm.addr(privateKey);
        console.log("owner Address:", owner);
    }

    function test_Name() public view {
        string memory name = bnb.name();
        console.log("name:", name);
    }

    function test_Owner() public {
        vm.prank(owner);
        console.log("owner:", msg.sender);
    }

    function test_ApproveRouter() public {
        vm.startPrank(owner);
        console.log("owner:", msg.sender);
        bnb.approve(swapAddress, 200000000000000000000000000);
        assertGt(bnb.allowance(msg.sender, swapAddress), 0);
        vm.stopPrank();
    }
}

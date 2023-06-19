// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import {Test} from "forge-std/Test.sol";
import {Wallet} from "../src/Wallet.sol";

contract TestWallet is Test {
    Wallet public wallet;

    function setUp() public {
        wallet = new Wallet();
    }

    function testSetOwner() public {
        wallet.setOwner(address(1));
        assertEq(wallet.owner(), address(1), "owner should be address 1");
    }

    function testSetOwnerFail() public {
        vm.prank(address(1));
        vm.expectRevert("only owner can set owner");
        wallet.setOwner(address(1));
    }
}

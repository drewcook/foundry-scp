// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import {Test} from "forge-std/Test.sol";
import {Event} from "../src/Event.sol";

contract TestEvent is Test {
    Event public e;
    event Transfer(address indexed from, address indexed to, uint256 amount);

    function setUp() public {
        e = new Event();
    }

    function testEmitTransferEvent() public {
        address from = address(1);
        address to = address(2);
        uint256 amount = 100;
        // 1. Tell foundry which data to check for
        // Check for index 1, index 2, and data
        vm.expectEmit(true, true, false, true);
        // 2. Emit the event with the data to expect
        emit Transfer(from, to, amount);
        // 3. Call the function that emits the event
        e.transfer(from, to, amount);
        // Check for only index 1
        vm.expectEmit(true, false, false, false);
        emit Transfer(from, to, amount);
        e.transfer(from, to, amount);
    }

    function testEmitManyTransferEvent() public {
        address from = address(1);
        address[] memory to = new address[](3);
        to[0] = address(123);
        to[1] = address(456);
        to[2] = address(789);
        uint256[] memory amounts = new uint256[](3);
        amounts[0] = 100;
        amounts[1] = 30;
        amounts[2] = 85;

        // Check for each event being emitted
        for (uint256 i = 0; i < to.length; i++) {
            vm.expectEmit(true, true, false, true);
            emit Transfer(from, to[i], amounts[i]);
        }

        // Call the function that emits it
        e.transferMany(from, to, amounts);
    }
}

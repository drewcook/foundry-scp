// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import {Test} from "forge-std/Test.sol";
import {Counter} from "../src/Counter.sol";

contract TestCounter is Test {
    Counter public counter;

    function setUp() public {
        counter = new Counter();
    }

    function testCountDefault() public {
        assertEq(counter.getCount(), 0, "count should default to zero");
    }

    function testSetCount() public {
        counter.setCount(100);
        assertEq(counter.getCount(), 100, "count should be 100");
    }

    function testIncrement() public {
        counter.increment();
        assertEq(counter.getCount(), 1, "count should have increased by one");
    }

    function testIncrementMax() public {
        counter.setCount(type(uint256).max);
        vm.expectRevert("count has reached maximum amount");
        counter.increment();
    }

    function testDecrement() public {
        counter.increment();
        counter.decrement();
        assertEq(counter.getCount(), 0, "count should have decreased by one");
    }

    function testDecrementMin() public {
        vm.expectRevert("count can not be less than zero");
        counter.decrement();
    }
}

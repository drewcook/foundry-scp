// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import {Test} from "forge-std/Test.sol";
import {HelloWorld} from "../src/HelloWorld.sol";

contract TestHelloWorld is Test {
    HelloWorld public helloWorld;

    function setUp() public {
        helloWorld = new HelloWorld();
    }

    function testGreeting() public {
        assertEq(helloWorld.greeting(), "Hello, world", "greeting should be Hello, world");
    }
}

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import {Test} from "forge-std/Test.sol";
import {Error} from "../src/Error.sol";

contract TestWrror is Test {
    Error public error;

    function setUp() public {
        error = new Error();
    }

    // If an error is expected within the test, preface the function name with 'testFail'
    // This is a special name for foundry tests
    function testFail() public view {
        error.throwError();
    }

    // Otherwise, use vm.expectRevert prior to making the failing call
    function testRevert() public {
        vm.expectRevert();
        error.throwCustomError();
    }

    function testRequireMessage() public {
        vm.expectRevert(bytes("not authorized"));
        error.throwError();
    }

    function testCustomError() public {
        vm.expectRevert(Error.NotAuthorized.selector);
        error.throwCustomError();
    }

    // Label assertions
    function testErrorLabel() public {
        assertEq(uint256(1), uint256(2), "this is a custom label");
    }
}

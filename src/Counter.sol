// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

contract Counter {
    uint256 private count;

    function getCount() public view returns (uint256) {
        return count;
    }

    function setCount(uint256 _count) public {
        count = _count;
    }

    function increment() public {
        require(count < type(uint256).max, "count has reached maximum amount");
        count++;
    }

    function decrement() public {
        require(count > 0, "count can not be less than zero");
        count--;
    }
}

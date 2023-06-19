// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

contract Wallet {
    address payable public owner;

    constructor() {
        owner = payable(msg.sender);
    }

    receive() external payable {}

    function withdraw(uint256 amount) public {
        require(msg.sender == owner, "only owner can withdraw");
        require(address(this).balance >= amount, "not enough funds");
        payable(msg.sender).transfer(amount);
    }

    function setOwner(address _owner) public {
        require(msg.sender == owner, "only owner can set owner");
        owner = payable(_owner);
    }
}

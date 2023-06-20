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

    /// @notice set the owner of the contract
    /// @param _owner the address of the new owner
    function setOwner(address _owner) public {
        require(msg.sender == owner, "only owner can set owner");
        owner = payable(_owner);
    }

    /// @notice get the balance of the contract
    /// @return the balance of the contract
    function getBalance() public view returns (uint256) {
        return address(this).balance;
    }

    // Create a function that requires a minimum deposit of 0.1 ether to be deposited into the contract
    function deposit() public payable {
        require(msg.value >= 0.1 ether, "minimum deposit is 0.1 ether");
    }
}

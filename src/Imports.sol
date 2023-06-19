// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import "solmate/tokens/ERC20.sol";

contract MyToken is ERC20("MyToken", "MTKN", 18) {}

import "@openzeppelin/contracts/access/Ownable.sol";

contract MyOwnable is Ownable {}

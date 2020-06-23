pragma solidity ^0.6.0;
// SPDX-License-Identifier: MIT

contract Counter {
  uint256 public value;
  
  function increase(uint256 amount) public {
    value += amount;
  }
}

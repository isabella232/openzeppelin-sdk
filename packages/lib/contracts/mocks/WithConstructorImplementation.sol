pragma solidity ^0.6.0;
// SPDX-License-Identifier: MIT

contract WithConstructorImplementation {
  uint256 public value;
  string public text;

  constructor(uint256 _value, string memory _text) public {
    require(_value > 0);
    value = _value;
    text = _text;
  }
}
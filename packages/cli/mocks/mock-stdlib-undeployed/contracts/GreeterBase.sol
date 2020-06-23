pragma solidity ^0.6.0;
// SPDX-License-Identifier: MIT

contract GreeterBase {
  event Greeting(string greeting);

  uint256 public value;

  function initialize(uint256 _value) public {
    value = _value;
  } 

  function clashingInitialize(uint256 _value) public {
    value = _value;
  } 
}

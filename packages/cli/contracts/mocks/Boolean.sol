pragma solidity ^0.6.0;
// SPDX-License-Identifier: MIT

contract Boolean {
  bool public value;

  function initialize(bool _value) public {
    value = _value;
  }
}

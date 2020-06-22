pragma solidity ^0.6.0;

contract Boolean {
  bool public value;

  function initialize(bool _value) public {
    value = _value;
  }
}

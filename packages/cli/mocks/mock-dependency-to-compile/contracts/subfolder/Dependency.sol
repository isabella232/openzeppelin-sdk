pragma solidity ^0.6.0;
// SPDX-License-Identifier: MIT

// Test import with path relative to current file
import "./DependencyLib.sol";

contract Dependency {
  using DependencyLib for string;
  
  event Greeting(string greeting);

  function greet(string memory who) public {
    emit Greeting(who.wrap());
  }
}

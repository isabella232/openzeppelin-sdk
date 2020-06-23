pragma solidity ^0.6.0;
// SPDX-License-Identifier: MIT

contract Greeter {
  event Greeting(string greeting);

  function greet(string memory who) public {
    emit Greeting(greeting(who));
  }

  function greeting(string memory who) public pure returns (string memory) {
    return who;
  }

  function say() public pure returns (string memory) {
    return "hello";
  }
}

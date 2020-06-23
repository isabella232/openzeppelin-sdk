pragma solidity ^0.6.0;
// SPDX-License-Identifier: MIT

contract GreeterImpl {
  event Greeting(string greeting);

  function greet(string memory who) public {
    emit Greeting(greeting(who));
  }

  function greeting(string memory who) public pure returns (string memory) {
    return who;
  }

  function version() public pure returns (string memory) {
    return "1.2.0";
  }
}

pragma solidity ^0.6.0;

import "./GreeterLib.sol";

contract GreeterImpl {
  using GreeterLib for string;
  event Greeting(string greeting);

  function greet(string memory who) public {
    emit Greeting(greeting(who));
  }

  function greeting(string memory who) public pure returns (string memory) {
    return who.wrap();
  }

  function version() public pure returns (string memory) {
    return "1.1.0";
  }
}

pragma solidity ^0.6.0;
// SPDX-License-Identifier: MIT

import "./GreeterLibWithLib.sol";

contract GreeterLibWithLibImpl {
  using GreeterLibWithLib for GreeterLibWithLib.State;

  GreeterLibWithLib.State state;

  function greeting() public view returns (uint256) {
    return state.getNumber();
  }

  function version() public pure returns (string memory) {
    return "1.1.0";
  }
}

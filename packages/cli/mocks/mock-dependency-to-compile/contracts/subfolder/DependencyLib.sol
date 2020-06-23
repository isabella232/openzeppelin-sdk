pragma solidity ^0.6.0;
// SPDX-License-Identifier: MIT

library DependencyLib {
  function wrap(string memory self) public pure returns (string memory) {
    return self;
  }
}

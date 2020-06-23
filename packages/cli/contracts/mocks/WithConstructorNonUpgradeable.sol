pragma solidity ^0.6.0;
// SPDX-License-Identifier: MIT

contract WithConstructorNonUpgradeable {
  uint public answer;

  constructor(uint x, string memory y, uint[] memory zs) public {
    answer = x + bytes(y).length + zs[1];
  }
}

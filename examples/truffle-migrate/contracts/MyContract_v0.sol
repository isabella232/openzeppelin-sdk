pragma solidity ^0.6.0;
// SPDX-License-Identifier: MIT

import "@openzeppelin/upgrades/contracts/Initializable.sol";

contract MyContract_v0 is Initializable {
  uint256 public value;
  
  function initialize(uint256 _value) initializer public {
    value = _value;
  }

  function version() public pure returns (string memory) {
    return "v0";
  }
}


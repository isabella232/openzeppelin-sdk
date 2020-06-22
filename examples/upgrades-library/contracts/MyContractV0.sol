pragma solidity ^0.6.0;

import "@openzeppelin/upgrades/contracts/Initializable.sol";

contract MyContractV0 is Initializable {
  uint256 public value;
  
  function initialize(uint256 _value) initializer public {
    value = _value;
  }
}


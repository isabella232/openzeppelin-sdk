pragma solidity ^0.6.0;
// SPDX-License-Identifier: MIT
import "@openzeppelin/upgrades/contracts/Initializable.sol";

contract CounterUpgradeable is Initializable {
    function initialize() external initializer {
        __init(true);
    }

    function __init(bool callChain) internal {
        
        
        
    }

  uint256 public value;
  
  function increase(uint256 amount) public {
    value += amount;
  }
}

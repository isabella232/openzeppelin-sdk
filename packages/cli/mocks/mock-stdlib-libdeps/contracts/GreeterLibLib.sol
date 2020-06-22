pragma solidity ^0.6.0;

library GreeterLibLib {
  struct StateState {
    uint256 aNumber;
  }

  function getANumber(StateState storage self) public view returns (uint256) {
    return self.aNumber;
  }
}

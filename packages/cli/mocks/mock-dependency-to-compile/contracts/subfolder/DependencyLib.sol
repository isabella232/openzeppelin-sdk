pragma solidity ^0.6.0;

library DependencyLib {
  function wrap(string memory self) public pure returns (string memory) {
    return self;
  }
}

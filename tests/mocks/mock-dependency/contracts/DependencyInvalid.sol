pragma solidity ^0.6.0;

contract DependencyWithConstructor {
  uint256 public dependencyValue;
  constructor() public {
    dependencyValue = 42;
  }
}
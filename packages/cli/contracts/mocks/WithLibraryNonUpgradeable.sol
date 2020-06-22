pragma solidity ^0.6.0;

import './Libraries.sol';

contract WithLibraryNonUpgradeable {
  uint public answer = UintLib.double(21);
}

pragma solidity ^0.6.0;
// SPDX-License-Identifier: MIT

import './Libraries.sol';

contract WithLibraryNonUpgradeable {
  uint public answer = UintLib.double(21);
}

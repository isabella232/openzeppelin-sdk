pragma solidity ^0.6.0;
// SPDX-License-Identifier: MIT


/**
 * @dev Implementation contract with an admin() function made to clash with
 * @dev AdminUpgradeabilityProxy's to test correct functioning of the
 * @dev Transparent Proxy feature.
 */
contract ClashingImplementation {

  function admin() external pure returns (address) {
    return 0x0000000000000000000000000000000011111142;
  }

  function delegatedFunction() external pure returns (bool) {
    return true;
  }
}

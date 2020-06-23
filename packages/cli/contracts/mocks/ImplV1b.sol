pragma solidity ^0.6.0;
// SPDX-License-Identifier: MIT

import "mock-stdlib-libdeps/contracts/GreeterLibWithLibImpl.sol";

contract ImplV1b is GreeterLibWithLibImpl {
  function say() public view returns(uint256) {
    return state.getNumber();
  }
}

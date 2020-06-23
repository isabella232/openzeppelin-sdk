pragma solidity ^0.6.0;
// SPDX-License-Identifier: MIT

library Numbers {
    function double(uint256 self) public pure returns (uint256) {
        return self * 2;
    }
}
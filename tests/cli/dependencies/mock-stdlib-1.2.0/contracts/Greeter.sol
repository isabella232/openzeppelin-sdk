pragma solidity ^0.6.0;
// SPDX-License-Identifier: MIT

import "./InternalLibrary.sol";

contract Greeter {
    using Numbers for uint256;

    string public who;

    constructor(string memory _who) public {
        who = _who;
    }

    function minor() public pure returns (uint256) {
        return 2;
    }

    function doubles(uint256 x) public pure returns (uint256) {
        return x.double();
    }
}

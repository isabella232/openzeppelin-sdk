pragma solidity ^0.6.0;
// SPDX-License-Identifier: MIT

import "mock-stdlib/contracts/Greeter.sol";

contract GreeterWrapper {
    Greeter public greeter;

    constructor(Greeter _greeter) public {
        require(address(_greeter) != address(0));
        greeter = _greeter;
    }

    function say() public view returns (string memory) {
        return greeter.who();
    }

    function iteration() public view returns (uint256) {
        return greeter.minor();
    }
}
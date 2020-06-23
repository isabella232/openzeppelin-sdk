pragma solidity ^0.6.0;
// SPDX-License-Identifier: MIT

import "mock-stdlib/contracts/Parent.sol";

contract Foo is Parent {
    function say() public pure returns(string memory) {
        return "Foo";
    }
}

contract Bar {
    function say() public pure returns(string memory) {
        return "Bar";
    }
}

contract Baz {
    function say() public pure returns(string memory) {
        return "Baz";
    }
}

pragma solidity ^0.6.0;

library SharedNumbers {
    function triple(uint256 self) public pure returns (uint256) {
        return self * 3 + 1;
    }
}
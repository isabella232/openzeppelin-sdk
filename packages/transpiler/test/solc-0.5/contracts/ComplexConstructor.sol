pragma solidity ^0.6.0;
// SPDX-License-Identifier: MIT

contract CCA {
    constructor(uint x) public { }
}
contract CCB is CCA {
    constructor(uint y) public CCA(y+1) { }
}
contract CCC is CCB {
    constructor(uint z) public CCB(z+1) { }
}
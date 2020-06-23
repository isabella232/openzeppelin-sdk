pragma solidity ^0.6.0;
// SPDX-License-Identifier: MIT

contract WithoutInitialValuesInFieldsDeclarations {
  uint constant myConst = 115994;

  function doSomething() public pure returns (string memory) {
    return 'do';
  }
}

contract WithInitialValuesInFieldsDeclarations {
  string public allaps = 'allaps';

  function doSomething() public pure virtual returns (string memory) {
    return 'do';
  }
}

contract WithParentWithInitialValuesInFieldsDeclarations is WithInitialValuesInFieldsDeclarations {
  string public myVar;

  function doSomething() public pure override returns (string memory) {
    return 'do';
  }
}

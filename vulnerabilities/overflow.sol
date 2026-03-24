// SPDX-License-Identifier: MIT
pragma solidity >=0.7.0 <0.9.0;

contract OverflowUnderflowExample {
    function overflowExample(uint8 _val) public pure returns (uint8) {
        uint8 maxValue = 255;
        // Si _val es 1, en Solidity < 0.8 esto NO falla: maxValue se vuelve 0.
        maxValue += _val; 
        return maxValue;
    }

    function underflowExample(uint8 _val) public pure returns (uint8) {
        uint8 minValue = 0;
        // Si _val es 1, en Solidity < 0.8 esto NO falla: minValue se vuelve 255.
        minValue -= _val;
        return minValue;
    }
}
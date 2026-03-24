// SPDX-License-Identifier: MIT
pragma solidity ^0.8;

import "./SafeMath.sol";

contract OverflowUnderflowExample {
    using SafeMath for uint8;

    function overflowExample(uint8 val) public pure returns (uint8) {
        uint8 maxValue = 255;
        // Usamos la función .add() que tiene el 'require' interno
        maxValue = uint8(maxValue.add(val));
        return maxValue;
    }

    function underflowExample(uint8 val) public pure returns (uint8) {
        uint8 minValue = 0;
        // Usamos la función .sub() que tiene el 'require' interno
        minValue = uint8(minValue.sub(val));
        return minValue;
    }
}
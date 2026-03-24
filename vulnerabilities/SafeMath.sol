// SPDX-License-Identifier: MIT
pragma solidity ^0.8;

library SafeMath {
    function add(uint256 a, uint256 b) internal pure returns (uint256) {
        uint256 c = a + b;
        // Verifica que el resultado no sea menor que uno de los sumandos
        require(c >= a, "SafeMath: addition overflow");
        return c;
    }

    function sub(uint256 a, uint256 b) internal pure returns (uint256) {
        // Verifica que no estemos restando más de lo que tenemos
        require(b <= a, "SafeMath: subtraction overflow");
        uint256 c = a - b;
        return c;
    }
}
// SPDX-License-Identifier: MIT
pragma solidity ^0.8;

contract CostlyOperationsVulnerable { // Nota: El nombre es el mismo en tu imagen
    uint256 constant public MAX_ITERATIONS = 1600;

    function performCostlyOperation() pure external returns (uint256 result) {
        // OPTIMIZACIÓN: Llamada a una función matemática O(1)
        result = sumNumbers(MAX_ITERATIONS);
    }

    function sumNumbers(uint256 n) internal pure returns (uint256) {
        // Fórmula de la suma de una progresión aritmética (Suma de Gauss)
        return (n * (n + 1)) / 2;
    }
}
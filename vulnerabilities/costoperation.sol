// SPDX-License-Identifier: MIT
pragma solidity ^0.8;

contract CostlyOperationsVulnerable {
    uint256 constant public MAX_ITERATIONS = 1600;

    function performCostlyOperation() pure external returns (uint256 result) {
        result = 0;

        // VULNERABILIDAD: Ciclo O(n). 
        // Si el número de iteraciones fuera muy grande o dinámico, 
        // la transacción podría exceder el límite de gas del bloque.
        for (uint256 i = 0; i < MAX_ITERATIONS; i++) {
            result += 1;
        }
    }
}
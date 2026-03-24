// SPDX-License-Identifier: MIT
pragma solidity ^0.8;

contract DenialServiceOptimizado {
    uint256 constant MAX_ITERATIONS = 100;

    function performDos(uint256 _iterations) pure public {
        // Validación para no exceder el límite de gas razonable
        require(_iterations <= MAX_ITERATIONS, "Excedio el numero maximo de iteraciones");

        for (uint256 i = 0; i < _iterations; i++) {
            uint256[] memory data = new uint256[](_iterations);

            for (uint256 j = 0; j < _iterations; j++) {
                data[j] = j;
            }
        }
    }
}
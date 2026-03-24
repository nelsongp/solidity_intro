// SPDX-License-Identifier: MIT
pragma solidity ^0.8;

contract DenialServiceVulnerable {
    function performDos(uint256 _iterations) pure public {
        for (uint256 i = 0; i < _iterations; i++) {
            // Creamos un nuevo array en memoria en cada iteración
            uint256[] memory data = new uint256[](_iterations);

            for (uint256 j = 0; j < _iterations; j++) {
                data[j] = j;
            }
        }
    }
}
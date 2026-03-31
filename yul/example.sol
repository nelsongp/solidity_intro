// SPDX-License-Identifier: MIT
pragma solidity ^0.8;

contract ContratOptimizado {
    // Consumo: 949 gas
    function sum(uint256 a, uint256 b) public pure returns (uint256){
        return a + b;
    }

    // Optimizada: 748 gas
    function sumYul(uint256 a, uint256 b) public pure returns (uint256 result){
        assembly {
            // Usamos el opcode 'add' de la EVM
            result := add(a, b)
        }
    }

    // 1 Funcion hash Solidity: 1056 gas
    function solidityHash(uint256 a, uint256 b) public pure {
        // abi.encodePacked genera un overhead de gas al preparar los datos
        keccak256(abi.encodePacked(a, b));
    }

    // Funcion hash YUL: 638 gas
    function yulHash(uint256 a, uint256 b) public pure {
        assembly {
            // Guardamos 'a' en la posición de memoria 0x00 (32 bytes)
            mstore(0x00, a)
            // Guardamos 'b' en la posición de memoria 0x20 (el siguiente slot de 32 bytes)
            mstore(0x20, b)
            
            // Calculamos el hash desde la posición 0x00 cubriendo 0x40 (64 bytes en total)
            let hash := keccak256(0x00, 0x40)
        }
    }
}
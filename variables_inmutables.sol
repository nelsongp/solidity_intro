// SPDX-License-Identifier: MIT
pragma solidity >=0.8.0 <0.9.0;

contract Immutable {
    // Comparación de GAS (según tus apuntes):
    // Con immutable: 43574 gas para desplegar, 22510 gas para ejecutar foo
    // Sin immutable: 45706 gas para desplegar, 24642 gas para ejecutar foo

    // Las variables inmutables se declaran con la palabra clave 'immutable'
    address public immutable owner;
    uint public x;

    // Se pueden asignar en el constructor (solo una vez)
    constructor() {
        owner = msg.sender;
    }

    function foo() external {
        // Leer una variable inmutable es mucho más barato que leer una normal
        require(msg.sender == owner);
        x += 1;
    }
}
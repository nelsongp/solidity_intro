// SPDX-License-Identifier: MIT
pragma solidity ^0.8.10;

// "selfdestruct"
// - eliminar contrato
// - forzar el envío de Ether a cualquier dirección

contract Kill {
    // El constructor es payable para poder cargarle fondos al inicio
    constructor() payable {}

    function killContract() external {
        // Elimina el código del contrato y envía los fondos al msg.sender
        selfdestruct(payable(msg.sender));
    }

    function testContract() external pure returns (string memory) {
        return "Estoy funcionando";
    }
}
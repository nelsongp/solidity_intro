// SPDX-License-Identifier: MIT
pragma solidity >=0.8.0 <0.9.0;

// 3 formas de enviar ETH:
// transfer - 2300 gas, revierte ante fallo
// send - 2300 gas, devuelve bool
// call - todo el gas, devuelve bool y datos

contract SendEther {
    // Permite que el contrato reciba fondos al ser desplegado
    constructor() payable {}

    // Función especial para recibir Ether cuando se envía sin datos
    receive() external payable {}

    // 1. TRANSFER: El método más "seguro" pero limitado
    function testTransfer(address payable _to) external payable {
        _to.transfer(123); // Envía 123 Wei
    }

    // 2. SEND: Devuelve un booleano en lugar de fallar automáticamente
    function testSend(address payable _to) external payable {
        bool send = _to.send(123);
        require(send, "send fallo"); // Debemos manejar el fallo manualmente
    }

    // 3. CALL: El método recomendado actualmente (más flexible)
    function testCall(address payable _to) external payable {
        // Devuelve un booleano de éxito y un buffer de datos
        (bool success, ) = _to.call{value: 123}("");
        require(success, "la llamada fallo");
    }
}

contract RecibirEther {
    event Log(uint amount, uint gas);

    // Se activa cuando alguien envía Ether a este contrato
    receive() external payable {
        emit Log(msg.value, gasleft()); // Registra cuánto dinero llegó y cuánto gas sobró
    }
}
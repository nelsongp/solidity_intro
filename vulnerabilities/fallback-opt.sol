// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract OptimizadoFallback {
    mapping(address => uint256) private balances;

    // Se ejecuta si alguien llama a una función que no existe
    fallback() external payable {
        revert("Esta funcion fallback no esta habilitada para recibir pagos");
    }

    // Única forma oficial de depositar y que se registre en el balance
    function deposit() external payable {
        balances[msg.sender] += msg.value;
    }

    function withdraw() public {
        uint256 amount = balances[msg.sender];
        require(amount > 0, "No hay fondos disponibles para retirar");
        
        // Efecto: Ponemos el balance a 0 ANTES de enviar el dinero (Seguridad ante Reentrada)
        balances[msg.sender] = 0;

        (bool success, ) = msg.sender.call{value: amount}("");
        require(success, "Transferencia fallida");
    }

    // Permite recibir Ether simple, pero sigue teniendo el riesgo de no actualizar 'balances'
    receive() external payable {}
}
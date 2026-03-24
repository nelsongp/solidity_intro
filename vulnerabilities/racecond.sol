// SPDX-License-Identifier: MIT
pragma solidity ^0.8;

contract CarreraVulnerable {
    uint256 public balance;
    mapping(address => uint256) public balances;

    function depositar() public payable {
        balances[msg.sender] += msg.value;
        balance += msg.value;
    }

    function retirar(uint256 _cantidad) public {
        require(balances[msg.sender] >= _cantidad, "Saldo insuficiente");

        uint256 saldoAnterior = balances[msg.sender];

        // Se resta el saldo antes de enviar (esto es bueno)
        balances[msg.sender] -= _cantidad;

        // Se envía el dinero
        require(payable(msg.sender).send(_cantidad), "Error al realizar la transferencia");

        // VULNERABILIDAD/ERROR DE LÓGICA:
        // Este require siempre fallará porque balances ya fue modificado arriba.
        require(balances[msg.sender] == saldoAnterior, "Race Condition detectada");
    }
}
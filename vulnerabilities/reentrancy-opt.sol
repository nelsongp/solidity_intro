// SPDX-License-Identifier: MIT
pragma solidity ^0.8;

contract ReentrancySefe {
    mapping(address => uint256) public balances;

    function deposit() external payable {
        balances[msg.sender] += msg.value;
    }

    function withdraw(uint256 _amount) external {
        require(balances[msg.sender] >= _amount, "Saldo insuficiente");

        // "OPTIMIZACIÓN": Usar .send() limita el gas a 2300.
        // El atacante no tiene gas suficiente para volver a entrar.
        require(payable(msg.sender).send(_amount), "Fallo en el envio");

        balances[msg.sender] -= _amount;
    }
}
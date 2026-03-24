// SPDX-License-Identifier: MIT
pragma solidity ^0.8;

contract UncheckedSend {
    mapping(address => uint256) public balances;

    function deposit() public payable {
        balances[msg.sender] += msg.value;
    }

    function withdraw(uint256 amount) public {
        require(balances[msg.sender] >= amount, "Saldo insuficiente");

        // Vulnerabilidad: Aunque .transfer() falla automáticamente,
        // se considera mala práctica por el límite de gas (2300).
        payable(msg.sender).transfer(amount);

        balances[msg.sender] -= amount;
    }
}
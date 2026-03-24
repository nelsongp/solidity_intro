// SPDX-License-Identifier: MIT
pragma solidity ^0.8;

contract ReentrancyVulnerable {
    mapping(address => uint256) private balances;

    function deposit() external payable {
        balances[msg.sender] += msg.value;
    }

    function withdraw(uint256 _amount) external {
        require(_amount <= balances[msg.sender], "Saldo insuficiente");

        // VULNERABILIDAD:
        // 1. Envías el dinero usando .call (que entrega todo el gas)
        (bool success, ) = msg.sender.call{value: _amount}("");
        require(success, "Transferencia fallida");

        // 2. Recién aquí restas el balance, pero para entonces el atacante
        // ya volvió a llamar a withdraw() diez veces.
        balances[msg.sender] -= _amount;
    }
}
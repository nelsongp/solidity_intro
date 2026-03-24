// SPDX-License-Identifier: MIT
pragma solidity ^0.8;

contract UncheckedSend {
    mapping(address => uint256) public balances;

    function deposit() public payable {
        balances[msg.sender] += msg.value;
    }

    function withdraw(uint256 amount) public {
        require(balances[msg.sender] >= amount, "Saldo insuficiente");

        // "Checked": Usamos .send() y verificamos que devuelva 'true'
        require(payable(msg.sender).send(amount), "Fallo el envio");

        balances[msg.sender] -= amount;
    }
}
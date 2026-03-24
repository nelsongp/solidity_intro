// SPDX-License-Identifier: MIT
pragma solidity ^0.8;

contract SecureAccessControl {
    uint private secretNumber;
    address private owner;

    constructor() {
        owner = msg.sender;
    }

    // El Modificador: La pieza clave de seguridad
    modifier onlyOwner() {
        require(msg.sender == owner, "Solo el propietario puede llamar a esta funcion");
        _; // Continúa con la ejecución de la función
    }

    // Ahora la función está protegida por el centinela
    function setSecretNumber(uint _newNumber) public onlyOwner {
        secretNumber = _newNumber;
    }

    function getSecretNumber() public view returns (uint) {
        return secretNumber;
    }
}
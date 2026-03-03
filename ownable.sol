// SPDX-License-Identifier: MIT
pragma solidity >=0.8.0 <0.9.0;

contract Propietario {
    //A public address variable that stores the owner of the contract.
    address public propietario;

    //Sets the deployer's address as the initial owner (msg.sender)
    constructor(){
        propietario = msg.sender;
    }

    // A modifier that restricts function access to the contract owner. 
    // It checks if the caller is the owner and reverts with "no es el propietario" (not the owner) if not.
    modifier soloPropietario(){
        require(msg.sender == propietario, "no es el propietario");
        _;
    }

    //An external function that allows the owner to transfer ownership to a new address. It uses the
    //soloPropietario modifier and includes a check to ensure the new owner address is not the zero address.
    function setPropietario(address _newOwner) external soloPropietario {
        require(_newOwner != address(0), "direccion invalida");
        propietario = _newOwner;
    }

    function soloPropietarioPuedeLlamar() view external soloPropietario returns (string memory) {
        return "Funcion ejecutada solo por el propietario del contrato";
    }

    function cualquieraPuedeLlamar() pure external  returns (string memory) {
        return "Funcion ejecutada por cualquier usuario";
    }
}
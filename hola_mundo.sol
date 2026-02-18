// SPDX-License-Identifier: MIT
pragma solidity >=0.8.0 <0.9.0

contract HolaMundo {

    // Variable de estado (se guarda en la blockchain)
    string private mensaje;

    // En el constructor se inicializan las variables a usar del conrato
    // Constructor se ejecuta una vez al desplegar el contrato
    constructor() {
        mensaje = "Hola Mundo";
    }

    // funcion para obtener el mensaje actual
    function getMensaje() public views returns (string memory) {
        return mensaje;
    }

    function updateMensaje( string memory nuevoMensaje ) public {
        mensaje = nuevoMensaje;
    }
}
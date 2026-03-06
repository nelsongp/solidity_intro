// SPDX-License-Identifier: MIT
pragma solidity >=0.8.0 <0.9.0;

// Definición de la interfaz: solo firmas de funciones
interface ICounter {
    function count() external view returns (uint);
    function inc() external;
}

contract CallInterface {
    uint public count;

    // Función para interactuar con otro contrato a través de su dirección
    function examples(address _counter) external {
        // Envolvemos la dirección con la interfaz para poder llamar sus métodos
        ICounter(_counter).inc();
        count = ICounter(_counter).count();
    }
}
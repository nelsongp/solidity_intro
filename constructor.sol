// SPDX-license-Identifier: MIT
pragma solidity >= 0.8.0 <0.9.0;

/// @title Contrato Persona -- sirve para definir el nombre del conrato como tal
/// @author Nelson Guardado
/// @notice Contrato de ejemplo que retorna el nombre de una personam -- descripcion del contrato
/// @dev Todas las funciones estan implementadas de forma didactica -- detalles adicionales del contrato
contract Persona {
    string private testNombre;

    /// @notice Guarda el nombre de una persona
    /// @dev La variable testNombre se guarda en blockchain
    function setNombre(string memory_nombre) public {
        testNombre = _nombre;
    }

    /// @return Retorna el nombre de la persona que ha sido guardada en la funcion setNombre
    function getNombre() public view returns (string memory) {
        return testNombre;
    }

    /// @dev Devuelve solo un texto fijo
    /// @return Devuelve un string fijo
    function poblacionMundial() external pure returs (string memory) {
        string memory poblacion = 'Poblacion Mundial Actual: 8.083.080.515';

        return poblacion;
    }
}
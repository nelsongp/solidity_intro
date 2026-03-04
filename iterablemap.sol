// SPDX-License-Identifier: MIT
pragma solidity >=0.8.0 <0.9.0;

contract IterableMapping {
    // 1. El almacén de datos
    mapping(address => uint) public balances;
    
    // 2. Para saber si ya hemos visto esta dirección (evita duplicados en la lista)
    mapping(address => bool) public inserted;
    
    // 3. El array que nos permite iterar (el índice)
    address[] public keys;

    // Agrega o actualiza un balance y gestiona la indexación
    function set(address _key, uint _val) public {
        balances[_key] = _val;

        if (!inserted[_key]) {
            inserted[_key] = true;
            keys.push(_key);
        }
    }

    // Devuelve el número total de elementos registrados
    function getSize() public view returns (uint) {
        return keys.length;
    }

    // Obtiene el balance del primer usuario registrado
    function first() public view returns (uint) {
        return balances[keys[0]];
    }

    // Obtiene el balance del último usuario registrado
    function last() public view returns (uint) {
        return balances[keys[keys.length - 1]];
    }

    // Obtiene el balance de un usuario según su posición en la lista (índice)
    function get(uint _index) public view returns (uint) {
        return balances[keys[_index]];
    }
}
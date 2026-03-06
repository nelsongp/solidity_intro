// SPDX-License-Identifier: MIT
pragma solidity >=0.8.0 <0.9.0;

/*
El fallback se ejecuta cuando:
- La función llamada no existe en el contrato.
- Se envía ETH directamente al contrato.

    ¿Se ejecuta fallback() o receive()?
    
        Se envía Ether al contrato
                   |
         ¿Está vacío el msg.data?
                /    \
              Sí      No
              /        \
      ¿Existe receive()?  fallback()
            /   \
          Sí     No
          /       \
      receive()   fallback()
*/

contract FallbackReceive {
    // Se ejecuta cuando msg.data está vacío
    receive() external payable { }

    // Se ejecuta cuando la función no existe o no hay receive()
    fallback() external payable { }
}
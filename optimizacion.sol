// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

/*
   Inicio - 50860 unidades de gas:

   - Usar calldata => 49115
   - Cargar variables de estado en la memoria => 31804
   - Cortocircuito => 31730
   - Incrementos de bucle => 31358
   - Caché de la longitud del array => 31323
   - Cargar elementos del array en la memoria => 31113
*/

contract GasRefactor {
    uint public total;
    // Ejemplo: [1, 4, 7, 8, 9, 100]

    function sumar(uint[] calldata nums) external {
        // 1. Cargamos la variable de estado 'total' a una variable local (Stack)
        uint _total = total;
        
        // 2. Caché de la longitud del array para no consultarla en cada vuelta
        uint len = nums.length;

        // 3. Incremento de bucle optimizado con ++i
        for (uint i = 0; i < len; ++i) {
            
            // 4. Cargamos el elemento del array en una variable local
            uint num = nums[i];

            // 5. Cortocircuito: si la primera condición es falsa, no evalúa la segunda
            if (num % 2 == 0 && num < 999) {
                _total += num;
            }
        }

        // 6. Escribimos en el storage UNA sola vez al final
        total = _total;
    }
}
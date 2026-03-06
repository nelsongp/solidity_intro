// SPDX-License-Identifier: MIT
pragma solidity >=0.8.0 <0.9.0;

library Math {
    function max(uint x, uint y) internal pure returns (uint) {
        return x >= y ? x : y;
    }
}

contract Test {
    function testMax(uint x, uint y) external pure returns (uint) {
        return Math.max(x, y);
    }
}

// Función que permita buscar la posición de un número que le pasemos
library ArrayLib {
    function find(uint[] storage arr, uint x) internal view returns (uint) {
        for (uint i = 0; i < arr.length; i++) {
            if(arr[i] == x) {
                return i;
            }
        }
        revert("not found");
    }
}

contract TestArray {
    uint[] public arr = [3, 2, 1];

    function testFind() external view returns (uint i){
        return ArrayLib.find(arr, 3);
    }
}
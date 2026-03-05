// SPDX-License-Identifier: MIT
pragma solidity >=0.8.0 <0.9.0;

contract LlamarContratoPrueba {
    // 1. Usando el tipo de contrato como parámetro
    function setX(ContractoPrueba _test, uint _x) external {
        _test.settX(_x);
    }

    // 2. Usando la dirección y haciendo "casting"
    function getX(address _test) external view returns (uint x) {
        x = ContractoPrueba(_test).getX();
    }

    // 3. Enviando Ether a la función del otro contrato
    function setXandSendEther(address _test, uint _x) external payable {
        ContractoPrueba(_test).setXandReceiveEther{value: msg.value}(_x);
    }

    // 4. Recibiendo múltiples valores de retorno
    function getXandValue(address _test) external view returns (uint x, uint value) {
        (x, value) = ContractoPrueba(_test).getXandValue();
    }
}

contract ContractoPrueba {
    uint public x;
    uint public value = 123;

    function settX(uint _x) external {
        x = _x;
    }

    function getX() external view returns (uint) {
        return x;
    }

    function setXandReceiveEther(uint _x) external payable {
        x = _x;
        value = msg.value;
    }

    function getXandValue() external view returns (uint, uint) {
        return (x, value);
    }
}
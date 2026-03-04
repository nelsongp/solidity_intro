// SPDX-License-Identifier: MIT
pragma solidity >=0.8.0 <0.9.0;

contract A {
    // virtual: Indica que esta función PUEDE ser modificada por un hijo
    function foo() public pure virtual returns(string memory) {
        return "A";
    }

    function bar() public pure virtual returns(string memory) {
        return "A";
    }

    // Al no ser virtual, baz() no está diseñada para ser cambiada
    function baz() public pure returns(string memory) {
        return "A";
    }
}

contract B is A {
    // override: Indica que estamos CAMBIANDO la lógica de la función del padre
    function foo() public pure override returns(string memory) {
        return "B";
    }

    // Podemos ser virtual y override a la vez si queremos que un nieto (C) vuelva a cambiarla
    function bar() public pure override virtual returns(string memory) {
        return "B";
    }
}

contract C is B {
    // C hereda de B, que a su vez hereda de A
    function bar() public pure override returns(string memory) {
        return "C";
    }
}
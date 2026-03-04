// SPDX-License-Identifier: MIT
pragma solidity >=0.8.0 <0.9.0;

contract X {
    function foo() public pure virtual returns(string memory) {
        return "X";
    }

    function bar() public pure virtual returns(string memory) {
        return "X";
    }

    function baz() public pure returns(string memory) {
        return "X";
    }
}

contract Y is X {
    // Y ya está sobrescribiendo a X
    function foo() public pure virtual override returns(string memory) {
        return "Y";
    }

    function bar() public pure virtual override returns(string memory) {
        return "Y";
    }

    function y() public pure returns(string memory) {
        return "Y";
    }
}

// Z hereda de X y de Y al mismo tiempo
contract Z is X, Y {
    // Cuando una función existe en varios padres, DEBES especificar a quiénes sobrescribes
    function foo() public pure override(X, Y) returns(string memory) {
        return "Z";
    }

    function bar() public pure override(X, Y) returns(string memory) {
        return "Z";
    }
}
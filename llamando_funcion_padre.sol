// SPDX-License-Identifier: MIT
pragma solidity >=0.8.0 <0.9.0;

contract E {
    event Log(string message);

    function foo() public virtual {
        emit Log("E.foo Original");
    }

    function bar() public virtual {
        emit Log("E.bar Original");
    }
}

contract F is E {
    function foo() public override virtual {
        emit Log("F.foo Sobreescrita en F");
        E.foo(); // Llamada DIRECTA al padre específico
    }

    function bar() public override virtual {
        emit Log("F.bar Sobreescrita en F");
        super.bar(); // Llamada mediante SUPER
    }
}

contract G is E {
    function foo() public override virtual {
        emit Log("F.foo Sobreescrita en G");
        E.foo(); // Llamada DIRECTA
    }

    function bar() public override virtual {
        emit Log("F.bar Sobreescrita en G");
        super.bar(); // Llamada mediante SUPER
    }
}

contract H is F, G {
    function foo() public override(F, G) {
        F.foo(); // Llama específicamente a F
    }

    function bar() public override(F, G) {
        super.bar(); // Llama a través de toda la cadena de herencia
    }
}
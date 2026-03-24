contract CarreraOptimizado {
    uint256 public balance;
    mapping(address => uint256) public balances;
    // El "candado" o estado de la transferencia
    mapping(address => bool) public isTransferring;

    function depositar() public payable {
        balances[msg.sender] += msg.value;
        balance += msg.value;
    }

    function retirar(uint256 _cantidad) public {
        require(balances[msg.sender] >= _cantidad, "Saldo insuficiente");
        
        // Verificamos que el "candado" esté abierto
        require(!isTransferring[msg.sender], "La transferencia ya esta en curso");

        // Cerramos el candado antes de interactuar
        isTransferring[msg.sender] = true;

        require(payable(msg.sender).send(_cantidad), "Error al realizar la transferencia");

        balances[msg.sender] -= _cantidad;

        // Abrimos el candado al finalizar
        isTransferring[msg.sender] = false;
    }
}
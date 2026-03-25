// SPDX-License-Identifier: MIT
pragma solidity >=0.8.0 <0.9.0;

contract UserCode {

    // 1. DEFINICIÓN DE DATOS
    struct User {
        uint256 id;
        string name;
        uint256 age;
        bool isActive;
    }

    // users: Mapeo que actúa como nuestra base de datos (ID -> Usuario)
    // Se guarda en STORAGE (permanente en la blockchain)
    mapping(uint256 => User) private users;
    
    // nextId: Contador para asignar IDs únicos y autoincrementables
    uint256 private nextId;

    // 2. EVENTOS (Para avisar al mundo exterior/Frontend)
    event UserCreated(uint256 id, string name, uint256 age);
    event UserUpdated(uint256 id, string name, uint256 age);
    event UserDeleted(uint256 id);

    /**
     * @notice Crea un nuevo usuario
     * @param _name Se usa 'memory' porque string es un tipo complejo y solo lo necesitamos temporalmente
     */
    function createUser(string memory _name, uint256 _age) public {
        // Creamos el struct y lo asignamos al mapping en la posición de nextId
        users[nextId] = User(nextId, _name, _age, true);
        
        emit UserCreated(nextId, _name, _age);
        
        // Incrementamos para que el siguiente usuario tenga un ID distinto
        nextId++;
    }

    /**
     * @notice Lee la información de un usuario
     * @dev 'view' indica que no modifica la blockchain, 'returns' define qué devolvemos
     */
    function readUser(uint256 _id) public view returns (User memory) {
        // Validaciones: El ID debe existir y el usuario debe estar activo
        require(_id < nextId, "El usuario no existe");
        require(users[_id].isActive, "El usuario esta inactivo");
        
        // Retornamos el struct. Ponemos 'memory' porque estamos devolviendo
        // una COPIA de los datos del storage para que el usuario la vea.
        return users[_id];
    }

    /**
     * @notice Actualiza nombre y edad de un usuario existente
     */
    function updateUser(uint256 _id, string memory _name, uint256 _age) public {
        require(_id < nextId, "El usuario no existe");
        require(users[_id].isActive, "El usuario esta inactivo");

        // KEY CONCEPT: 'storage' aquí crea un PUNTERO o referencia.
        // No es una copia; es como decir "user" es el mismo objeto que está en la DB.
        User storage user = users[_id];
        
        // Al modificar 'user', se modifica automáticamente la blockchain (users[_id])
        user.name = _name;
        user.age = _age;
        
        emit UserUpdated(_id, _name, _age);
    }

    /**
     * @notice Realiza un 'Soft Delete' (borrado lógico) desactivando al usuario
     */
    function deleteUser(uint256 _id) public {
        require(_id < nextId, "El usuario no existe");
        require(users[_id].isActive, "El usuario esta inactivo");
        
        // No borramos la fila, solo marcamos que ya no cuenta como activo
        users[_id].isActive = false;
        
        emit UserDeleted(_id);
    }

    /**
     * @notice Devuelve una lista de todos los usuarios con isActive = true
     * @return User[] memory Un arreglo dinámico con los datos de usuarios activos
     */
    function getAllActiveUsers() public view returns(User[] memory) {
        uint256 activeCount = 0;
        
        // 1. Primero contamos cuántos están activos para saber el tamaño del array
        for (uint256 i = 0; i < nextId; i++){
            if (users[i].isActive){
                activeCount++;
            }
        }

        // 2. Creamos un array en MEMORIA. 
        // En memoria, los arrays DEBEN tener un tamaño fijo al crearse (new User[](tamaño))
        User[] memory activeUsers = new User[](activeCount);
        
        // 3. Llenamos el array con los datos que nos interesan
        uint256 index = 0;
        for (uint256 i = 0; i < nextId; i++) {
            if (users[i].isActive) {
                activeUsers[index] = users[i];
                index++;
            }
        }
        
        return activeUsers;
    }
}
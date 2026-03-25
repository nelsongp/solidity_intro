// SPDX-License-Identifier: MIT
pragma solidity >=0.8.0 <0.9.0;

contract UserCode {

    struct User {
        uint256 id;
        string name;
        uint256 age;
        bool isActive;
    }

    mapping(uint256 => User) private users;
    uint256 private nextId;

    event UserCreated(uint256 id, string name, uint256 age);
    event UserUpdated(uint256 id, string name, uint256 age);
    event UserDeleted(uint256 id);

    //CrearUsuario
    function createUser(string memory _name, uint256 _age) public {
        users[nextId] = User(nextId, _name, _age, true);
        emit UserCreated(nextId, _name, _age);
        nextId++;
    }

    //LeerUsuario
    function readUser(uint256 _id) public view returns (User memory) {
        require(_id < nextId, "El usuario no existe");
        require(users[_id].isActive, "El usuario esta inactivo");
        return users[_id];
    }

    //UpdateUsuario
    function updateUser(uint256 _id, string memory _name, uint256 _age) public {
        require(_id < nextId, "El usuario no existe");
        require(users[_id].isActive, "El usuario esta inactivo");
        User storage user = users[_id];
        user.name = _name;
        user.age = _age;
        emit UserUpdated(_id, _name, _age);
    }

    //Eliminar usuario
    function deleteUser(uint256 _id) public {
        require(_id < nextId, "El usuario no existe");
        require(users[_id].isActive, "El usuario esta inactivo");
        users[_id].isActive = false;
        emit UserDeleted(_id);
    }

    //GetAllUsers
    function getAllActiveUsers() public view returns(User[] memory) {
        uint256 activeCount = 0;
        for (uint256 i = 0; i < nextId; i++){
            if (users[i].isActive){
                activeCount++;
            }
        }

        User[] memory activeUsers = new User[](activeCount);
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
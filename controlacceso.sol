// SPDX-License-Identifier: MIT
pragma solidity >=0.8.0 <0.9.0;

contract ControlAcceso {
    // Eventos para notificar cambios a aplicaciones externas (DApps)s
    event AsignarRole(bytes32 indexed role, address indexed account);
    event RevocarRole(bytes32 indexed role, address indexed account);

    // Mapeo anidado: Rol => Usuario => Posee permiso (true/false)
    mapping (bytes32 => mapping (address => bool)) public roles;

    // Constantes pre-calculadas para ahorrar Gas
    bytes32 private constant ADMIN = keccak256(abi.encodePacked("ADMIN"));
    bytes32 private constant USER = keccak256(abi.encodePacked("USER"));

    // Modificador dinámico que verifica si el que llama tiene un rol específico
    modifier onlyAdmin(bytes32 _role) {
        require(roles[_role][msg.sender], "No tienes permisos de administrador");
        _;
    }

    // El constructor asigna el poder total a quien despliega el contrato
    constructor() {
        _asignarRole(ADMIN, msg.sender);
    }

    // --- Funciones Internas (Lógica base) ---

    function _asignarRole(bytes32 _role, address _account) internal {
        roles[_role][_account] = true;
        emit AsignarRole(_role, _account);
    }

    function _revocarRole(bytes32 _role, address _account) internal {
        roles[_role][_account] = false;
        emit RevocarRole(_role, _account);
    }

    // --- Funciones Externas (Puntos de entrada protegidos) ---

    function asignarRole(bytes32 _role, address _account) external onlyAdmin(ADMIN) {
        _asignarRole(_role, _account);
    }

    function revocarRole(bytes32 _role, address _account) external onlyAdmin(ADMIN) {
        _revocarRole(_role, _account);
    }
}
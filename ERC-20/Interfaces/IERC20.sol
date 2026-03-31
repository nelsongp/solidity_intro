// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

interface IERC20 {
    // EVENTOS: Para que aplicaciones externas (como Etherscan) rastreen movimientos
    event Transfer(address indexed _from, address indexed _to, uint256 _value);
    event Approval(address indexed _owner, address indexed _spender, uint256 _value);

    // FUNCIONES DE LECTURA (view): No cuestan gas si se llaman desde fuera
    function totalSupply() external view returns(uint256); // Cantidad total de tokens en existencia
    function balanceOf(address _owner) external view returns(uint256); // Saldo de una cuenta específica
    function allowance(address _owner, address _spender) external view returns(uint256); // Cuánto puede gastar un tercero

    // FUNCIONES DE ESCRITURA: Modifican el estado y cuestan gas
    function transfer(address _to, uint256 _value) external returns(bool); // Envío directo de tokens
    function approve(address _spender, uint256 _value) external returns(bool); // Autorizar a alguien más
    function transferFrom(address _from, address _to, uint256 _value) external returns (bool); // Mover tokens autorizados
}
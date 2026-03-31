// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

interface IERC20MEtadata {
    //funciones opcionales
    function name() external view returns (string memory);
    function symbol() external view returns (string memory);
    function decimals() external view returns (uint8);
}
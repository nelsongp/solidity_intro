// SPDX-License-Identifier: MIT
pragma solidity ^0.8;

contract RamdomnessVulnerable {
    uint private seed;
    uint public randomNumber;

    constructor() {
        seed = block.timestamp;
    }

    function generateRandomNumber() public {
        // VULNERABLE: Valores predecibles y manipulables
        randomNumber = uint(keccak256(abi.encodePacked(block.difficulty, block.timestamp, seed)));
    }
}
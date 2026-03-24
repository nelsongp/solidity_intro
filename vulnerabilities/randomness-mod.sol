// SPDX-License-Identifier: MIT
pragma solidity ^0.8;

interface RandomnessOracle {
    function getRandomNumber() external returns (uint);
}

contract RamdomnessOptimizado {
    uint public randomNumber;
    address private oracle;

    constructor(address _oracleAddress) {
        oracle = _oracleAddress;
    }

    function generateRandomNumber() public {
        require(oracle != address(0), "Oracle address not set");
        // DELEGA: El azar viene de fuera de la blockchain
        randomNumber = RandomnessOracle(oracle).getRandomNumber();
    }
}
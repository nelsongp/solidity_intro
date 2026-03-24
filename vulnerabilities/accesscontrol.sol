// SPDX-License-Identifier: MIT
pragma solidity ^0.8;

contract VulnerableAccessControl {
    uint private secretNumber;
    address public owner;

    constructor() {
        owner = msg.sender;
    }

    function setSecretNumber(uint _newNumber) public {
        secretNumber = _newNumber;
    }

    function getSecretNumber() public view returns (uint) {
        return secretNumber;
    }
}
// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

contract Counter {
    uint256 private count;

    constructor(uint256 _count) {
        count = _count;
    }

    function setNumber(uint256 newNumber) public {
        count = newNumber;
    }

    function incrementCounter() public {
        count++;
    }

    function decrementCounter() public {
        count--;
    }

    function getCount() public view returns (uint256) {
        return count;
    }
}

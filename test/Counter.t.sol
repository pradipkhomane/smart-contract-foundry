// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test, console} from "forge-std/Test.sol";
import {Counter} from "../src/Counter.sol";

contract CounterTest is Test {
    Counter public counter;

    function setUp() public {
        counter = new Counter(1);
        counter.setNumber(1);
    }

    function test_Increment() public {
        counter.incrementCounter();
        assertEq(counter.getCount(), 2);
    }

    function testFuzz_SetNumber(uint256 x) public {
        counter.setNumber(x);
        assertEq(counter.getCount(), x);
    }

    function test_GetCount() public {
        uint256 val =  counter.getCount();
        assertEq(val, 1);
        emit log_named_uint("This is int val: ", val);
    }
}

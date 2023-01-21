// SPDX-License-Identifier: BSD-2-Clause
pragma solidity ^0.8.16;

/*
Create a function that checks if a number n is divisible by two numbers x AND y. 
All inputs are positive, non-zero numbers.
*/

contract Kata {
    function isDivisible(
        int256 n,
        int256 x,
        int256 y
    ) public pure returns (bool) {
        return (n % x == 0) && (n % y == 0);
    }
}

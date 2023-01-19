// SPDX-License-Identifier: BSD-2-Clause
pragma solidity ^0.8.16;

/*
Write a program that finds the summation of every number from 1 to num. 
The number will always be a positive integer greater than 0.
*/

contract Kata {
    function summation(int256 n) public pure returns (int256) {
        int256 total;

        for (int256 i = 0; i <= n; i++) {
            total += i;
        }

        return total;
    }
}

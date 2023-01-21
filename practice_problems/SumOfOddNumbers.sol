// SPDX-License-Identifier: BSD-2-Clause
pragma solidity ^0.8.16;

/*
Given the triangle of consecutive odd numbers:
Calculate the sum of the numbers in the nth row of this 
triangle (starting at index 1) e.g.: (Input --> Output)
*/

contract Kata {
    function rowSumOddNumbers(int256 n) public pure returns (int256) {
        return n * n * n;
    }
}

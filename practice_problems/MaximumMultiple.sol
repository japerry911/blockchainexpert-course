// SPDX-License-Identifier: BSD-2-Clause
pragma solidity ^0.8.16;

/*
Given a Divisor and a Bound , Find the largest integer N , Such That ,
Conditions:
N is divisible by divisor
N is less than or equal to bound
N is greater than 0.
*/

contract Kata {
    function maxMultiple(int256 d, int256 b) public pure returns (int256) {
        return (b / d) * d;
    }
}

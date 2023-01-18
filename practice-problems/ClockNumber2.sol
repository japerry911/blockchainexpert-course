// SPDX-License-Identifier: BSD-2-Clause
pragma solidity ^0.8.16;

/*
Clock shows h hours, m minutes and s seconds after midnight.
Your task is to write a function which returns the time since 
midnight in milliseconds.
*/

contract Kata {
    function past(
        int256 h,
        int256 m,
        int256 s
    ) public pure returns (int256) {
        int256 totalMs;

        totalMs += h * 60 * 60 * 1000;
        totalMs += m * 60 * 1000;
        totalMs += s * 1000;

        return totalMs;
    }
}

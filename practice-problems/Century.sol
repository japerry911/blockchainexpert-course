// SPDX-License-Identifier: BSD-2-Clause
pragma solidity ^0.8.16;

/*
Given a year, return the century it is in.
*/

contract Kata {
    function century(int256 year) public pure returns (int256) {
        int256 returnCentury = year / 100;

        if (year % 100 != 0) {
            returnCentury += 1;
        }

        return returnCentury;
    }
}

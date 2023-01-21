// SPDX-License-Identifier: BSD-2-Clause
pragma solidity ^0.8.16;

/*
This function should test if the factor is a factor of base.
Return true if it is a factor or false if it is not.
*/

contract Kata {
    function checkForFactor(int256 base, int256 factor)
        public
        pure
        returns (bool)
    {
        return base % factor == 0;
    }
}

// SPDX-License-Identifier: BSD-2-Clause
pragma solidity ^0.8.16;

/*
You are given two interior angles (in degrees) of a triangle.
Write a function to return the 3rd.
Note: only positive integers will be tested.
*/

contract ThirdAngle {
    function otherAngle(int256 angle1, int256 angle2)
        public
        pure
        returns (int256)
    {
        int256 a1 = angle1;
        int256 a2 = angle2;

        return 180 - a1 - a2;
    }
}

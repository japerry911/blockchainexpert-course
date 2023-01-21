// SPDX-License-Identifier: BSD-2-Clause
pragma solidity >=0.4.22 <=0.8.17;

contract MathUtils {
    function floor(int256 value) public pure returns (int256) {
        return value - (value % 10);
    }

    function ceil(int256 value) public pure returns (int256) {
        if (value % 10 == 0) {
            return value;
        } else if (value > 0) {
            return value + (10 - (value % 10));
        } else {
            return value - (10 + (value % 10));
        }
    }

    function average(int256[] memory values, bool down)
        public
        pure
        returns (int256)
    {
        if (values.length == 0) {
            return 0;
        }

        int256 totalSum;
        for (uint256 i; i < values.length; i++) {
            totalSum += values[i];
        }

        if (down) {
            return floor(totalSum / int256(values.length));
        } else {
            return ceil(totalSum / int256(values.length));
        }
    }
}

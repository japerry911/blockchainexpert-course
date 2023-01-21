// SPDX-License-Identifier: BSD-2-Clause
pragma solidity >=0.4.22 <=0.8.17;

contract FizzBuzz {
    uint256 count;

    event Fizz(address sender, uint256 indexed count);
    event Buzz(address sender, uint256 indexed count);
    event FizzAndBuzz(address sender, uint256 indexed count);

    function increment() external {
        count++;

        if (count % 3 == 0 && count % 5 == 0) {
            emit FizzAndBuzz(msg.sender, count);
        } else if (count % 3 == 0) {
            emit Fizz(msg.sender, count);
        } else if (count % 5 == 0) {
            emit Buzz(msg.sender, count);
        }
    }
}

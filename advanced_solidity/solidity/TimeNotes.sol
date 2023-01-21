// SPDX-License-Identifier: BSD-2-Clause
pragma solidity >=0.7.0 <0.9.0;

contract Sandbox1 {
    function getTime() public view returns (uint256) {
        return block.timestamp;
    }
}

contract Sandbox2 {
    uint256 expiry;
    uint256 count;

    constructor() {
        expiry = block.timestamp + 1 minutes;
    }

    function addOne() public {
        require(block.timestamp < expiry);
        count++;
    }
}

contract Sandbox3 {
    uint256 public lastTime;
    uint256 count;

    constructor() {
        lastTime = block.timestamp;
    }

    function increment() public {
        count++;
        lastTime = block.timestamp;
    }

    function getMinutesSinceLastCall() public view returns (uint256) {
        return (block.timestamp - lastTime) / 1 minutes;
    }
}

pragma solidity >=0.4.22 <=0.8.17;

contract EventEmitter {
    uint256 eventCount = 1;

    event Called(uint256 count, address indexed sender);

    function count() public {
        emit Called(eventCount, msg.sender);
        eventCount++;
    }
}

pragma solidity >=0.4.22 <=0.8.17;

contract OnlyOwner {
    address public owner;
    uint8 x;

    constructor() {
        owner = msg.sender;
    }

    function add(uint8 number) external {
        require(msg.sender == owner, "not the owner");
        x += number;
    }

    function subtract(uint8 number) external {
        require(msg.sender == owner, "not the owner");
        x -= number;
    }

    function get() external view returns (uint8) {
        require(msg.sender == owner, "not the owner");
        return x;
    }
}

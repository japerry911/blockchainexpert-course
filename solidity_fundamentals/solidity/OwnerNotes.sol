pragma solidity >=0.7.0 <0.9.0;

contract Sandbox {
    address public owner;

    constructor() {
        owner = msg.sender;
    }

    receive() external payable {}

    function withdraw(uint256 amount) public {
        require(msg.sender == owner, "you are not the owner");
        require(address(this).balance >= amount, "not enough balance");
        (bool sent, ) = payable(owner).call{value: amount}("");
        require(sent, "failed to send");
    }
}

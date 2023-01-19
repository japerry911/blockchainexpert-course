pragma solidity >=0.7.0 <0.9.0;

contract Sandbox {
    address owner;

    constructor() {
        owner = msg.sender;
    }

    receive() external payable {}

    function destroy() external {
        require(msg.sender == owner, "you are not the owner");
        selfdestruct(payable(owner));
    }

    function getOwner() public view returns (address) {
        return owner;
    }
}

contract Winner {
    address winner;
    uint256 balance;

    function pay() external payable {
        require(msg.value == 1 ether, "you need to send 1 ether");
        balance += 1 ether;
        if (address(this).balance == 7 ether) {
            winner = msg.sender;
        }
    }

    function withdraw() public {
        require(msg.sender == winner, "you are not the winner");
        (bool sent, ) = payable(winner).call{value: balance}("");
        require(sent, "payment failed");
    }
}

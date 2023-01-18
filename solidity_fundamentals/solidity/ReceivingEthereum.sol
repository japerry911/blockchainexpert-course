pragma solidity >=0.4.22 <=0.8.17;

contract Balances {
    mapping(address => uint256) balances;

    receive() external payable {
        balances[msg.sender] += msg.value;
    }

    fallback() external payable {
        balances[msg.sender] += msg.value;
    }

    function getAmountSent(address addr) public view returns (uint256) {
        return balances[addr];
    }
}

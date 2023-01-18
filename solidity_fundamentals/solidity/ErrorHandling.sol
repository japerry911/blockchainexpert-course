pragma solidity >=0.7.0 <0.9.0;

// error BalanceNotLargeEnough(uint256 balance, uint256 amount);

contract Sandbox {
    error BalanceNotLargeEnough(uint256 balance, uint256 amount);

    mapping(address => uint256) balances;

    function deposit() external payable {
        balances[msg.sender] += msg.value;
    }

    function withdraw(uint256 amount) public {
        uint256 balance = balances[msg.sender];
        if (balance < amount) {
            revert BalanceNotLargeEnough(balance, amount);
        }
        // require(balance >= amount, "balance is not sufficient");
        balances[msg.sender] -= amount;
        (bool sent, ) = payable(msg.sender).call{value: amount}("");
        // assert(balances[msg.sender] == balance - amount);
        // require(sent, "payment failed");
        if (!sent) {
            revert("payment failed");
        }
    }
}

// SPDX-License-Identifier: BSD-2-Clause
pragma solidity >=0.4.22 <=0.8.17;

contract GreedyBanker {
    error WithdrawingMoreThanBalance(uint256 withrawAmount, uint256 balance);
    error InsufficientFundsPostFee(int256 postFeeDeposit);

    address owner;

    mapping(address => uint256) usersBalances;
    mapping(address => bool) usersChargeFee;

    uint256 constant fee = 1000 wei;
    uint256 feesBalance;

    constructor() {
        owner = msg.sender;
    }

    receive() external payable {
        uint256 finalDepositAmount = msg.value;
        if (usersChargeFee[msg.sender]) {
            feesBalance += 1000 wei;
            if (finalDepositAmount < 1000 wei) {
                revert InsufficientFundsPostFee(
                    int256(finalDepositAmount) - 1000
                );
            }
            finalDepositAmount -= 1000 wei;
        } else {
            usersChargeFee[msg.sender] = true;
        }

        usersBalances[msg.sender] += finalDepositAmount;
    }

    fallback() external payable {
        feesBalance += msg.value;
    }

    function withdraw(uint256 amount) external {
        if (amount > usersBalances[msg.sender]) {
            revert WithdrawingMoreThanBalance(
                amount,
                usersBalances[msg.sender]
            );
        }

        usersBalances[msg.sender] -= amount;
        (bool sent, ) = payable(msg.sender).call{value: amount}("");
        require(sent, "withdrawal failed");
    }

    function getBalance() external view returns (uint256) {
        return usersBalances[msg.sender];
    }

    function collectFees() external {
        require(msg.sender == owner, "you are not the owner");

        uint256 amount = feesBalance;
        feesBalance = 0;

        (bool sent, ) = payable(owner).call{value: amount}("");
        require(sent, "withdrawal failed");
    }
}

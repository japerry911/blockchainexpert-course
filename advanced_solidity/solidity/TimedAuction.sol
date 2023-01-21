// SPDX-License-Identifier: BSD-2-Clause
pragma solidity >=0.7.0 <0.9.0;

contract TimedAuction {
    uint256 auctionExpiry;
    uint256 currentMaxBid;
    uint256 withdrawalsLeft;

    address currentMaxBidder;
    address owner;

    mapping(address => uint256) withdrawableAmounts;

    event Bid(address indexed sender, uint256 amount, uint256 timestamp);

    constructor() {
        owner = msg.sender;
        auctionExpiry = block.timestamp + 5 minutes;
    }

    function bid() external payable {
        require(block.timestamp < auctionExpiry, "the auction has ended");
        require(
            msg.value > currentMaxBid,
            "your bid is not greater than current max bid"
        );

        emit Bid(msg.sender, msg.value, block.timestamp);

        if (withdrawableAmounts[currentMaxBidder] == 0) {
            withdrawalsLeft++;
        }
        withdrawableAmounts[currentMaxBidder] += currentMaxBid;

        currentMaxBidder = msg.sender;
        currentMaxBid = msg.value;
    }

    function withdraw() external {
        require(
            withdrawableAmounts[msg.sender] >= 0,
            "no funds available for withdrawal"
        );

        uint256 amount = withdrawableAmounts[msg.sender];
        withdrawableAmounts[msg.sender] = 0;
        withdrawalsLeft--;
        (bool sent, ) = payable(msg.sender).call{value: amount}("");
        require(sent, "withdrawal failed");
    }

    function claim() external {
        require(msg.sender == owner, "you are not the owner");
        require(block.timestamp >= auctionExpiry, "the auction has not ended");
        require(
            withdrawalsLeft == 0,
            "there are still withdrawals that need to be made by bidders"
        );

        selfdestruct(payable(owner));
    }

    function getHighestBidder() external view returns (address) {
        return currentMaxBidder;
    }
}

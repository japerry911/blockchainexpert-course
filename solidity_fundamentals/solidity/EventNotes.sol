pragma solidity >=0.7.0 <0.9.0;

contract Auction {
    address owner;

    uint256 highestBid;
    address highestBidder;

    mapping(address => uint256) oldBids;

    event Bid(address indexed bidder, uint256 value);
    event StopAuction(address indexed highestBidder, uint256 highestBid);

    constructor() {
        owner = msg.sender;
    }

    function bid() external payable {
        require(msg.value > highestBid, "bid too low");
        require(owner != msg.sender, "owner cannot bid");

        oldBids[highestBidder] = highestBid;
        highestBid = msg.value;
        highestBidder = msg.sender;

        emit Bid(highestBidder, highestBid);
    }

    function withdraw() external {
        require(msg.sender != owner, "owner cannot withdraw");

        uint256 value = oldBids[msg.sender];
        (bool sent, ) = payable(msg.sender).call{value: value}("");
        require(sent, "payment failed");
    }

    function stopAuction() external {
        require(msg.sender == owner, "not the owner");
        emit StopAuction(highestBidder, highestBid);
        selfdestruct(payable(owner));
    }
}

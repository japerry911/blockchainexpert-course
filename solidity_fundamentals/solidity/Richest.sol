pragma solidity >=0.4.22 <=0.8.17;

contract Richest {
    address richestUser;
    uint256 richestAmount;
    mapping(address => uint256) pendingWithdrawls;

    function becomeRichest() external payable returns (bool) {
        if (msg.value <= richestAmount) {
            return false;
        }

        pendingWithdrawls[richestUser] += richestAmount;
        richestUser = msg.sender;
        richestAmount = msg.value;

        return true;
    }

    function withdraw() external {
        uint256 amount = pendingWithdrawls[msg.sender];
        pendingWithdrawls[msg.sender] = 0;
        (bool sent, ) = payable(msg.sender).call{value: amount}("");
        require(sent);
    }

    function getRichest() public view returns (address) {
        return richestUser;
    }
}

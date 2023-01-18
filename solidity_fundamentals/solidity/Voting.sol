pragma solidity >=0.4.22 <=0.8.17;

contract Voting {
    error InvalidVotingNumber(uint8 number);
    error UserAddressAlreadyVoted(address user);

    mapping(uint8 => uint256) numberVotes;
    mapping(address => bool) usersVotingStatus;
    uint8 currentWinner;
    uint256 currentTopVotesCount;

    function getVotes(uint8 number) public view returns (uint256) {
        if (number < 1 || number > 5) {
            revert InvalidVotingNumber(number);
        }

        return numberVotes[number];
    }

    function vote(uint8 number) external {
        if (number < 1 || number > 5) {
            revert InvalidVotingNumber(number);
        }

        if (usersVotingStatus[msg.sender]) {
            revert UserAddressAlreadyVoted(msg.sender);
        }

        usersVotingStatus[msg.sender] = true;
        numberVotes[number] += 1;

        if (numberVotes[number] >= currentWinner) {
            currentWinner = number;
            currentTopVotesCount = numberVotes[number];
        }
    }

    function getCurrentWinner() public view returns (uint8) {
        if (currentTopVotesCount == 0) {
            return 1;
        } else {
            return currentWinner;
        }
    }
}

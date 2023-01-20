// SPDX-License-Identifier: BSD-2-Clause
pragma solidity >=0.4.22 <=0.8.17;

contract EtherElection {
    address owner;
    address winner;

    uint256 numberOfCandidates;
    uint256 prizePool;
    uint256 feesPool;

    mapping(address => bool) candidateBoolList;
    mapping(address => uint256) candidateVoteCount;
    mapping(address => bool) userHasVoted;

    bool winnerWithdrew;

    constructor() {
        owner = msg.sender;
    }

    function enroll() external payable {
        require(msg.value == 1 ether, "must send exactly 1 ether");
        require(
            numberOfCandidates < 3,
            "there are already 3 candidates enrolled"
        );
        require(!candidateBoolList[msg.sender], "candidate already enrolled");

        candidateBoolList[msg.sender] = true;
        numberOfCandidates++;
        prizePool += msg.value;
    }

    function vote(address candidate) external payable {
        require(msg.value == 10000 wei, "must send exactly 10,000 wei");
        require(
            candidateBoolList[candidate],
            "must be a valid enrolled candidate"
        );
        require(!userHasVoted[msg.sender], "you can only vote once");
        require(
            winner == address(0),
            "there has already been declared a winner"
        );

        feesPool += msg.value;
        userHasVoted[msg.sender] = true;
        candidateVoteCount[candidate]++;

        if (candidateVoteCount[candidate] >= 5) {
            winner = candidate;
        }
    }

    function getWinner() external view returns (address) {
        require(winner != address(0), "there is no declared winner yet");
        return winner;
    }

    function claimReward() external {
        require(winner != address(0), "there is no declared winner yet");
        require(msg.sender == winner, "you are not the winner");
        require(!winnerWithdrew, "you already withdrew your reward");

        uint256 amount = prizePool;
        prizePool = 0;
        winnerWithdrew = true;
        (bool sent, ) = payable(msg.sender).call{value: amount}("");
        require(sent, "withdraw failed");
    }

    function collectFees() external {
        require(msg.sender == owner, "you are not the owner");
        require(winner != address(0), "there is no declared winner yet");
        require(winnerWithdrew, "the winner has not withdrawn yet");
        selfdestruct(payable(owner));
    }
}

pragma solidity >=0.4.22 <=0.8.17;

contract Following {
    error MaxFollowing(uint256 maxFollowers, uint256 followers);

    uint256 constant maxFollowers = 3;

    mapping(address => address[]) followingMapping;

    function follow(address toFollow) public {
        uint256 currentFollowerCount = followingMapping[msg.sender].length;
        if (currentFollowerCount >= 3) {
            revert MaxFollowing(maxFollowers, currentFollowerCount);
        }

        require(msg.sender != toFollow, "cannot follow yourself");

        followingMapping[msg.sender].push(toFollow);
    }

    function getFollowing(address addr) public view returns (address[] memory) {
        return followingMapping[addr];
    }

    function clearFollowing() public {
        delete followingMapping[msg.sender];
    }
}

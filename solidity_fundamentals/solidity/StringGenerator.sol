pragma solidity >=0.4.22 <=0.8.17;

contract StringGenerator {
    bytes currentString;
    mapping(address => bool) hasAddedCharacter;

    function addCharacter(string memory character) public {
        require(
            hasAddedCharacter[msg.sender] == false,
            "address has already added a character"
        );
        require(currentString.length < 5, "string has reached maximum length");
        bytes memory passedString = bytes(character);
        require(
            passedString.length == 1,
            "character argument must be a single character"
        );
        hasAddedCharacter[msg.sender] = true;
        currentString.push(passedString[0]); // this works because we know the length of the string is 1
    }

    function getString() public view returns (string memory) {
        return string(currentString);
    }
}

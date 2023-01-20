pragma solidity >=0.7.0 <0.9.0;

contract Sandbox {
    uint256[] public numbers = [1, 2];

    function add(uint256 x) public {
        numbers.push(x);
    }

    function pop() public {
        numbers.pop();
    }

    function length() public view returns (uint256) {
        return numbers.length;
    }

    function remove(uint256 idx) public {
        delete numbers[idx];
    }
}

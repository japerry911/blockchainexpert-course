pragma solidity >=0.4.22 <=0.8.17;

contract Inventory {
    mapping(uint256 => int256) quantities;

    function addItem(uint256 itemId, uint256 quantity) public {
        quantities[itemId] += int256(quantity);
    }

    function getQuantity(uint256 itemId) public view returns (int256) {
        if (quantities[itemId] > 0) {
            return quantities[itemId];
        } else {
            return -1;
        }
    }
}

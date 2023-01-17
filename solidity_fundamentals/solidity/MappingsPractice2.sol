pragma solidity >=0.4.22 <=0.8.17;

contract DebtTracking {
    mapping(address => mapping(address => uint256)) owing;

    function addDebt(
        address toBePaidAddress,
        address payingAddress,
        uint256 amount
    ) public {
        owing[toBePaidAddress][payingAddress] += amount;
    }

    function payDebt(
        address toBePaidAddress,
        address payingAddress,
        uint256 amount
    ) public {
        owing[toBePaidAddress][payingAddress] -= amount;

        if (owing[toBePaidAddress][payingAddress] < 0) {
            owing[payingAddress][toBePaidAddress] = owing[toBePaidAddress][
                payingAddress
            ];
        }
    }

    function getDebt(address toBePaidAddress, address payingAddress)
        public
        view
        returns (uint256)
    {
        return owing[toBePaidAddress][payingAddress];
    }
}

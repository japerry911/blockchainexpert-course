// SPDX-License-Identifier: BSD-2-Clause
pragma solidity >=0.4.22 <=0.8.17;

contract AdvancedCounter {
    error CounterIdAlreadyExists(string counterId);
    error CounterIdDoesNotExist(string counterId);

    mapping(address => mapping(string => bool)) counterIdsExists;
    mapping(address => uint256) numberOfCounterIds;
    mapping(address => mapping(string => int256)) countersMap;

    function createCounter(string memory id, int256 value) external {
        require(
            numberOfCounterIds[msg.sender] < 3,
            "there are already 3 counters for this user"
        );

        if (checkIfIdExists(id, msg.sender)) {
            revert CounterIdAlreadyExists(id);
        }

        countersMap[msg.sender][id] = value;
        counterIdsExists[msg.sender][id] = true;
        numberOfCounterIds[msg.sender]++;
    }

    function deleteCounter(string memory id) external {
        if (!checkIfIdExists(id, msg.sender)) {
            revert CounterIdDoesNotExist(id);
        }

        counterIdsExists[msg.sender][id] = false;
        numberOfCounterIds[msg.sender]--;
        delete countersMap[msg.sender][id];
    }

    function decrementCounter(string memory id) external {
        if (!checkIfIdExists(id, msg.sender)) {
            revert CounterIdDoesNotExist(id);
        }

        countersMap[msg.sender][id]--;
    }

    function getCount(string memory id) external view returns (int256) {
        if (!checkIfIdExists(id, msg.sender)) {
            revert CounterIdDoesNotExist(id);
        }

        return countersMap[msg.sender][id];
    }

    function incrementCounter(string memory id) external {
        if (!checkIfIdExists(id, msg.sender)) {
            revert CounterIdDoesNotExist(id);
        }

        countersMap[msg.sender][id]++;
    }

    function checkIfIdExists(string memory id, address addr)
        internal
        view
        returns (bool)
    {
        return counterIdsExists[addr][id];
    }
}

pragma solidity >=0.4.22 <=0.8.17;

contract LargestHolder {
    address[] holders;
    uint256[] balances;

    bool balancesSubmitted;

    uint256 txRequired;

    uint256 processStartIdx;
    uint256 processEndIdx;

    address largestHolder;
    uint256 currentLargestBalance;

    function submitBalances(
        uint256[] memory _balances,
        address[] memory _holders
    ) public {
        require(!balancesSubmitted, "balances have already been submitted");
        balancesSubmitted = true;
        holders = _holders;
        balances = _balances;

        txRequired = holders.length / 10;
        if (txRequired * 10 < holders.length) {
            txRequired++; // need to handle remainder from division
        }

        processEndIdx = 10;
        if (processEndIdx > balances.length) {
            // make sure we do not iterate over values that do not exist
            processEndIdx = balances.length;
        }
    }

    function process() public {
        require(balancesSubmitted, "balances have not yet been submitted");
        require(txRequired > 0, "you have already processed the balances");

        for (uint256 idx = processStartIdx; idx < processEndIdx; idx++) {
            uint256 amount = balances[idx];

            if (amount > currentLargestBalance) {
                address account = holders[idx];
                largestHolder = account;
                currentLargestBalance = amount;
            }
        }

        processStartIdx = processEndIdx;
        processEndIdx += 10;
        if (processEndIdx > balances.length) {
            processEndIdx = balances.length;
        }
        txRequired--;
    }

    function numberOfTxRequired() public view returns (uint256) {
        require(balancesSubmitted, "balances have not yet been submitted");
        return txRequired;
    }

    function getLargestHolder() public view returns (address) {
        require(txRequired == 0, "you have not finished processing");
        return largestHolder;
    }
}

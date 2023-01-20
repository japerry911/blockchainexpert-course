pragma solidity >=0.7.0 <0.9.0;

contract Sandbox {
    uint256 public sum;
    uint256 constant sumTo = 1000;

    function addIntegers() public {
        for (uint256 i = 1; i <= sumTo; i++) {
            sum += i;
        }
    }
}

contract Batch {
    uint256 public sum;
    uint256 constant sumTo = 1000;
    uint256 start = 0;
    uint256 end = 100;

    function addIntegers() public {
        require(end <= sumTo);

        // uint256 startGas = gasleft();
        uint256 increment = 100;

        for (uint256 i = start; i <= end; i++) {
            sum += i;
        }

        start = end + 1;
        end += increment;
    }
}

contract GasLeft {
    uint256 public sum = 0;
    uint256 public gasLeft = 0;

    function test() public {
        uint256 startGas = gasleft();

        for (uint256 i; i < 100; i++) {
            sum += i;
        }

        gasLeft = startGas - gasleft();
    }
}

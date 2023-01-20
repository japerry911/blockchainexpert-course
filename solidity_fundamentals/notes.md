# Notes

### MetaMask Setup

- metamask - browser extension and mobile application that provides a cryptocurrency wallet and makes it simple to interact with DApps and send/receive ethereum and other cryptocurrencies

### Remix IDE

- remix - free IDE for smart contract development
    - available in-browser or as desktop application

### Your First Smart Contract

- pragma line - placed at the beginning of code in Solidity
    - indicates Solidity compiler version(s) that can be used with the contract
    - example:
        ```solidity
        pragma solidity >=0.7.0 >0.9.0;
        ```

### Smart Contract Theory

- transaction - represents a state changing operation, 'tx'
- call - free operation that reads information from a smart contract
    - do not require transactions and cannot modify the state of a smart contract
- gas - fee required to execute transactions or smart contracts
    - paid in ether and denoted in gwei
- source code - the code that programmers read/write
- bytecode - program code that is been compiled from source code into a lower level image that can be understood by an interpreter

### Deploying Smart Contracts

- EVM - Ethereum Virtual Machine
    - computation engine that runs on ethereum nodes, such as miners
    - allows for the execution of smart contracts
    - foundation for Ethereum's entire operating structure

### Solidity Data Types

- data types
    - `uint`
    - `int`
    - `bool`
    -  `address`
    - `bytes`

### Operators & Type Conversions

- `&&` - and
- `||` - or
- `!` - not

### Conditionals

- conditionals
    - `>`
    - `>=`
    - `<`
    - `<=`
    - `==`
    - `!=`

### Mappings

- mapping - reference data type
    - allows you to store key-value pairs
    - can only be stored in contract storage

### Functions And Access Modifiers

- public - visibility modifier that can be used to mark variables and functions as accessible from within or outside of the contract
    - can be accessed from any location when marked as public
- private - visibility modifier that can be used to mark variables and functions as only accessible from within contract it is defined in
    - can only be accessed from location they are defined in
- internal - visibility modifer used to mark variables and functions as only accessible from within the contract or any derived contracts
    - internal functions can only be called from the contract they are defined in
- external - visibility modifier used to mark variables and functions as only callable from outside of the contract itself
    - external functions can only be called from outside of the blockchain or from another smart contract
- pure - a pure function is one that does not rely on any contract state to execute
    - can call other pure functions and utilize types like structs and enums
- view - a function that does not mutate/modify the state of a contract, but may read it
    - view functions can read contract state and call other view and pure functions

### Global Keywords

- global keywords - give you information about current block, transaction, and more
    - some of these global keywords
        - `block` - block that the transaction is on, **not** the block where the contract is on
            - `block.number`
            - `block.chainid`
            - `block.gaslimit`
            - `block.difficulty`
            - `block.timestamp`
        - `msg`
            - `msg.sender` - receive the address of whoever made the external function call, which could be another smart contract and not necessarily the address of whoever originally created the transaction
            - `msg.data`
            - `msg.sig`
            - `msg.value`
        - `tx`
            - `tx.origin` - the most correct way to determine the address of the creator of the transaction
        - `this`
- global method example - `gasleft()`

### Sending And Receiving Eth

- ether units - Solidity provides built-in keywords that make working with amounts of Ether easier
    - `wei` - smallest unit of ether
    - `gwei` - equal to 1,000,000,000 `wei` or 10e9 `wei`
    - `ether` - equal to 1,000,000,000,000,000,000 `wei` or 10e18 `wei`
- receiving methods
    1. `fallback`
        - used as a last resort or backup in case the contract cannot handle the call it receives
        - fallback is called anytime Ethereum is sent to the contract and no receive function is defined
        - if the receive function is defined and no msg.data is passed then receive will be called instead of fallback
        - If Ethereum is sent and msg.data is not empty then the fallback function will be called instead of receive. 
        - Lastly, if a function that does not exist on the contract is called the fallback function will be called.
    2. `receive`
    3. custom `payable` method 
- sending methods
    1. `send`
    2. `transfer`
    3. `call`
        - recommended

### Exceptions And Errors

- require - Solidity function that is used for error handling
    - if condition passed to require returns `false`, then the transaction will fail and the contract state will revert
    - used to check for preconditions that should be `true` before executing a block of code
    - returns remaining gas
    - The require statement is used to check for prerequisites before running a function. In this case the prerequisite is that the caller must be a specific address, warranting the use of a require statement. If a require statement fails it returns the remaining gas to the sender and reverts any state changes.
- assert - Solidity function that is used for error handling
    - if condition passed to assert returns `false`, then the transaction will fail and the contract state will revert
    - used to check for conditions that should never be `false`
    - consumes all of gas
    - An assert statement is used to check for invariants and verify contract state. An assert statement should never return false, if it does this means there is a bug or issue with your smart contract. assert's are used as a last line of defense and are typically placed near the end of a function. In this scenario, since we are checking an invariant related to state of the smart contract we would use an assert and hope that this would never be false.
- revert - Solidity function that when called causes a transaction to fail and the state of the contract to revert
    - used as alternative to `require` when you have complex logic
    - The revert statement does the same as the require statement and is typically used when handling complex logic. It doesn't evaluate a condition or return a value, however, it may include a custom error message or use a custom error object.

### Constructors

- constructor - called one time when the contract is deployed
    - used to initialize values or accept initial vlaues required by the contract
    - example:
    ```solidity
    contract Constructor {
        uint256 count;

        constructor(uint256 startingCount) {
            count = startingCount;
        }
    }
    ```

### Self Destruct

- self destruct - `selfdestruct` functions removes a smart contract from the blockchain and sends the balance of that contract to a provided address
    - the selfdestruct function always passes Ethereum to the address that is passed as an argument, even if that address is a smart contract that doesn't implement fallback or receive.
    - Calling selfdestruct immediately deletes the state held in the smart contract and makes it unusable. However, all transactions that were sent to the smart contract are still stored on the blockchain.

### Events

- event - emitted by smart contracts and stored in transaction logs
    - useful for transmitting information from a smart contract to outside of the blockchain network
    - clients outside of the blockchain can query event data or listen to specific events to occur
    - Event data is stored in transaction receipts. It is not stored in the contract.
    - The maximum number of parameters you can mark as indexed is three. indexed keywords are referred to as topics and are the fields you can use to search for events.
    - Events can be declared in the both the global namespace as well as the contract namespace.
    - In Solidity, you define an event by using the type event followed by the event name and the event parameters. If you decide to list an event parameter as indexed you put the indexed keyword between the type and the parameter name. Once the event is defined you can emit it by using the emit keyword followed by the event with the correct parameters passed.

### Arrays

- fixed-sized array - data structure whose size is determined when it is created/allocated and cannot change
    - example:
    ```solidity
        uint256[5] fixedArray = [1, 2, 3, 4, 5];
    ```
- dynamic-sized array - data structure that allows elements to be removed or added and can change its size
    - can only be defined in storage and have access to methods such as `push()` and `pop()`
    - example:
    ```solidity
        uint256[] = dynamicArray;
    ```
    - can use `pop()` and `push()`
- arrays are costly to use in terms of gas, especially dynamic-sized
- In Solidity, any assignment from storage to memory always makes a copy

### Strings

- strings - data type used to store UTF-8 encoded characters
    - reference type
    - not possible to do index access, `+=`, `pop`, `push`, `length`, etc...
        - have to manipulate string yourself
    - not very flexible
    - expensive to use
    - difficult to manipulate
    - it is prefered to use the `bytes` type when possible
- bytes - data type that represents an array of bytes
    - useful for storing characters as raw data
    - must be stored in `memory`, `calldata`, or `storage`
    - have index access, `pop`, `push`, `length`, `delete`, etc...
    - example:
    ```solidity
        bytes myRawData = "hello world";
    ```
- Both string and bytes values can be converted between each type. For example, it is valid to assign a string literal ("hello world") to a bytes variable.
- comparison of strings and bytes
    - The string type stores the UTF-8 encoded data of an underlying bytes array. When using string types you have no access to .length or index access; this makes strings very inflexible. The bytes type stores raw byte data and provides index access as well as the .length property. Both bytes and string types can be stored in memory, storage and calldata. However, if a bytes type is defined in storage it can be a dynamic byte array allowing access to .push() and .pop().

### Gas Cost and Estimation

- gas - fee required to execute transactions or smart contracts
    - paid in ether and denoted in gwei

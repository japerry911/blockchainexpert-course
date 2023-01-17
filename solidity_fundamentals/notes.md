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
            - `msg.sender`
            - `msg.data`
            - `msg.sig`
            - `msg.value`
        - `tx`
            - `tx.origin`
        - `this`
- global method example - `gasleft()`

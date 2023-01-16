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

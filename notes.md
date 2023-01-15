# Notes

### Introduction to Blockchain

- blockchain
    - a system of recording information in a way that makes it difficult or impossible to change, hack, or cheat
    - essentially a digital ledger of transactions that is duplicated and distributed across the entire network of computer systems on the blockchain
    - not owned a central entity

### Centralized vs Decentralized Systems

- centralized systems
    - most systems today are centralized
    - controlled by single entity
- decentralization
    - process by which the activities of an organization, particularly those regarding planning and decision making, are distributed or delegated away from a central, authoritative location or group
    - allow for trust-less interactions

| Centralized Systems                             | Decentralized Systems                           |
| ------------------------------------------------| ------------------------------------------------|
| low network diameter, allowing fast flow of data| large network diameter, data may flow slower    |
| simple to implement, highly performant usually  | difficult to implement with lower throughput    |
| data conflicts are easily solved                | complex protocol needed to dispute conflicts    |
| single point of failure, easy to take down      | no single point of failure                      |
| central authority that can sensor/modify data   | censorship is much harder, usually impossible   |
| participation is regulated by central authority | anyone can participate, no 'gatekeepers'        |

### Ledgers

- a blockchain is a distributed, decentralized, publicly available ledger of transactions that are verified
- a ledger is simply a collection or store of financial accounts or information
    - immutable - unchanging over time or unable to be changed
    - publicly available
    - decentralized - controlled by several authorities rather than a single one
    - distributed - shared or spread out
    - chronological - in order in which they occurred
    - irrevocable - not able to be changed, reversed, or recovered; final
- hash function - "one way" functions that have no known inverse. Foundation of internet security and cryptography, have the following properties:
    - fast to compute
    - generate a uniform output (digest)
    - no known inverse
    - deterministic
    - very rare hash collisions

### Wallets

- private key
    - acts as password for account, do **not** share
- public key
    - identifier for account, safe to share
    - longer and less convenient form of an address
- address
    - on Ethereum, an address is made up of 20 bytes, shorter version of public key
- seed phrases
    - backup/recovery code for wallet
    - 12 or 21 English words (2048 words to pick from)

### Transactions

- digital signature - attached to message or transaction to prove that the sending user has adequate permissions
    - to create you need:
        - private key (signing key) associated with public key of the sender of the transaction
- transaction has:
    - from
    - to
    - amount
    - signature
    - gas/fee
        - pays the miners to have the transaction added to blockchain
    - tx (transaction) hash
        - hash of above information
        - unique identifier for transaction
    - for ethereum two additional fields
        - nonce - transaction counter
        - data - contains things like "what function is called on smart contract"
            - might contain smart contract itself
- verification key - public keey
- signing key - private key

### Blocks

- block - place where blockchain data is stored
    - magic number - identifies network for block
    - block size - size limit of the block
    - block header - contains metadata on block
    - transaction count - number of transactions
    - transaction data 
    - version
    - previous block hash
    - hash merkle root
    - timestamp
    - bits/difficulty - difficulty rating of block
    - nonce - proves block is valid/it has been validated
        - added by miner
    - block reward
- genesis block - on bitcoin blockchain, this is the block ever created, it contains special information on the blockchain network as a whole
    - defines many things, for example:
        - difficulty & difficulty interval
        - mining reward & reward changes
        - circulating supply
- nonce - special number that is added to the contents of a block by miners
    - used to make the hash of a block start with a certain number of zeros, it provides the proof of work for a block

### Blockchain Security

- double spending - occurs when someone can spend the same funds multiple times
- balance - having sufficient balance to send funds
    - which is why you need to provide transaction inputs
- exploited code
- 51% attack - occurs when some entity is able to control over 50% of blockchain network mining hash rate

### Proof of Work

- proof of work - part of a consensus mechanism used by a blockchain network
    - miners compete to find a valid proof of work for blocks they assembled based on recent transactions
    - involves finding a special value (the nonce) that when added to a block makes the hash of the block start with a certain number of zeros
    - uses a lot of energy
- mining difficulty - represented by a field known as bits
    - the number of bits states the number of zeros that the hash of each block must start with to be accepted as valid
    - miners must find a valid nonce that when added to a block makes its hash start with the number of bits zeros
- miner - special node on a blockchain network that is responsible for validating incoming transactions and assembling them into blocks
    - miners compete/race to be the first to submit a valid block to the network
    - upon submitting a valid block, miners are compensated by receiving that block's reward (if any) and the sum of all of the transaction fees (gas)

### Proof of Stake

- proof of stake - part of a consensus mechanism used by a blockchain network
    - validators are selected to verify the next set of transactions
    - validators must provide a stake/collateral that can be slashed if they act with malicious intent
    - uses significantly less energy than proof of work
- validator - used to denote a node in a proof of stake blockchain network that validates transactions and creates new blocks
    - typically must provide a stake/collateral to ensure they act ethically
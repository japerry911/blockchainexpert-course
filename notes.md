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
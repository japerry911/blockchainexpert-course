# Notes

### Time and Time Units

- time units - various built-in time units
    - valid time units in Solidity
        - seconds
        - minutes
        - hours
        - days
        - weeks
- unix epoch is the time 00:00:00 UTC on January 1st, 1970

### Structs

- struct - typed collection of fields that can be treated like a custom type
    - useful for grouping data together
    - example:
    ```solidity
        struct Book {
            string title;
            string author;
            uint256 book_id;
        }
    ```

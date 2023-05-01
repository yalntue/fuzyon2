# fuzyon2

Hash Table
This is a basic implementation of a hash table data structure in Rust programming language. A hash table is a data structure that allows efficient insertion, deletion and retrieval of key-value pairs. This implementation uses a vector of tuples to store the key-value pairs.

Usage
To use the HashTable struct, you can create a new instance by calling the new method:


let mut table = HashTable::new();
You can then insert key-value pairs into the hash table using the insert method:


table.insert("key1", "value1");
table.insert("key2", "value2");
table.insert("key3", "value3");
table.insert("key4", "value4");
To retrieve a value associated with a key, you can call the get method:

let value = table.get("key3");
The get method returns an Option<&str> which is Some(value) if the key exists in the hash table, otherwise it returns None.

Implementation Details
The HashTable struct has two fields:

data is a vector of Option<(String, String)> representing the underlying storage for the hash table.
size is the number of key-value pairs currently stored in the hash table.
The hash_function method is used to compute the index of the vector for a given key. It uses a simple hash function that takes each byte of the key, shifts the current hash value left by 5 bits, adds the byte value to it, and then performs a bitwise AND with the absolute value of the current hash value. This is a basic hash function that avoids collisions by distributing the keys evenly across the hash table.

The insert method adds a new key-value pair to the hash table by computing the index of the vector for the key and setting the corresponding element to Some((key.to_string(), value.to_string())). If a key-value pair with the same key already exists in the hash table, the old value is overwritten.

The get method retrieves a value associated with a key by computing the index of the vector for the key and checking if the corresponding element contains a key-value pair with a matching key. If a match is found, the method returns the value associated with the key, otherwise it returns None.

The Debug trait is implemented for the HashTable struct to enable debugging output using the println! macro.

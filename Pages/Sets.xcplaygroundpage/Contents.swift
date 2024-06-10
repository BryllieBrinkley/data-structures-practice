import Foundation

// Sets- unordered collections of unique values. They ensure that each element appears only once.

//Creating a set
var uniqueNumbers: Set<Int> = [1, 2, 3, 3, 4, 5] // even though 3 is in the set 2x, it will only be recognized once when printing.

print(uniqueNumbers) // [3, 4, 1, 5, 2] - 5 elements

// adding and removing elements in a set
uniqueNumbers.insert(6) // .insert method adds a value to the set.
uniqueNumbers.insert(99)
uniqueNumbers.remove(1) // .remove method removes a value from the set.

print(uniqueNumbers) // [99,5, 2, 3, 6, 4] - 6 elements


//Checking for membership
let containsFive = uniqueNumbers.contains(5) //true
let containsSeven = uniqueNumbers.contains(7) //false

// Use cases: Sets are useful for when you need to ensure the uniqueness of elements or when you want to perform set operations like union, intersection, and difference.

import Foundation

// Arrays: An ordered collection of elements with a fixed size. You can store elements of the same type in an array.


// Creating an array of integers\
var numbers = [1, 2, 3, 5, 8, 10, 12, 16]
var letters = ["A", "B", "C", "D"]
var animals = ["cat", "dog", "bird", "shark", "giraffe"]

//Accessing elements
let firstElement = numbers[0]
let secondElement = numbers [1]

//Modifying Elements

// append method adds to the end of the array.
numbers.append(6)
numbers.append(107)
letters.append("Z")
animals.append("snake")
animals.append("fish")
// Error: numbers.append("dog") // will not work because all elements must be of the same type.


//Changing an element in an array
// object[expression] syntax. the expression should evaluate to a string or Symbol that represents the property's name
numbers[3] = 50
numbers[0] = 99
// Error: numbers[10] = 75 prints an index out of range error since the array is only 10 elements



//Iterating through an array
// Use a for..in loop to iterate through an array of elements..

for number in numbers {
    print(number)
} // result [99, 2, 3, 50, 8, 10, 12, 16, 6, 107]


for number in numbers {
    print(number + 10)
} // result [109, 12, 13, 60, 18, 20, 22, 26, 16, 117]

for item in animals {
    print(item)
} // result [cat, dog, bird, shark, girrafe, snake, fish]

// Use cases for Arrays: When you need to store and access a list of items in a specific order.

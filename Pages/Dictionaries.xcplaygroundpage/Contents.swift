import Foundation

// Swift Dictionaries
// Dictionaries in Swift are collections of "key-value" pairs. -- Each key in a dictionary is unique, and you can use the key to retrieve it's corresponding value
// ** Each time you print, dictionary will be in a random order

//Creating a dictionary
var studentGrades = ["Alice": 90, "Bob": 85, "Charlie": 82]

var capitalCity = ["North Carolina": "Charlotte", "Italy": "Rome", "England": "London"]

//Accessing values
let aliceGrades = studentGrades["Alice"] // 90

capitalCity["England"] // London

//Modifying values
studentGrades["David"] = 88 // appends the key-value pair "David: 88" to the array.
studentGrades["Charlie"] = 99 // modifies the value for Charlie from 82 to 99.

capitalCity["China"] = "Beijing" // adds key-value pair "China": "Beijing"


//Iterating through a dictionary
for (name, grade) in studentGrades {
    print("\(name): \(grade)")
}

for (place, capitalOf) in capitalCity {
    print("\(capitalOf) is the capital of \(place)")
}

// Use cases: Dictionaries are ideal when you need to associate values with uniques keys. They are efficient for quick lookup based on keys.

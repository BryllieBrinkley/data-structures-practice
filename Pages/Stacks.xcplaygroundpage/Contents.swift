import Foundation

// Stacks are data structures that follow the LIFO (Last In, First Out) rule. You can push elements to the stack and pop them off the stack in reverse order.

// Creaing stacks
var stack: [Int] = []

//Pushing elements
stack.append (1)
stack.append(2)
stack.append(3)
stack.append(4) // when 4 was appended, 4 was stored to the poppedElement below

print(stack) // [1, 2, 3, 4]

//"Popping" elements
let poppedElement = stack.popLast() // removes the last element added on the stack and stores it into the constant "poppedElement".

print(poppedElement) // prints 3, then 4 later on when added above.

print(stack) // [1, 2, 3] --> after last element was "popped" (*follows LIFO)

stack.popLast() // pops 3
stack.popLast() // pops 2
print(stack) // [1]

// Stacks are helpful in scenarios like implementing an undo feature,
// or parsing expressions where you need to reverse the order of processing.

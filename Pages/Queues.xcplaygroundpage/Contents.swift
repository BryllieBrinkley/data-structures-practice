import Foundation

// Queues are data structures that follow the First In, First Out (FIFO) principle. Elements are added to the rear and removed from the front of the queue.

// Creating a queue
var queue: [Int] = []

//Enqueuing elements
queue.append(1)
queue.append(2)
queue.append(3)

print(queue) //[1, 2, 3]

//Dequeuing elements
let dequeuedElement = queue.removeFirst()

print(dequeuedElement) // dequeues 1 (FIFO)

print(queue) // [2, 3]

// Queues are essentials for tasks like scheduling, managing print jobs, and implementing algorithms like BFS (Breadth-First-Search)

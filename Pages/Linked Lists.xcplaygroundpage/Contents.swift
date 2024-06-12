import Foundation

// A linked list is a chain of nodes.

// Nodes have two responsibilities: 1. To hold a value, 2. Hold a reference to the next node. A nil value represents the end of the list.
// Linked lists come in various forms, including singly linked lists, doubly linked lists, and circular linked lists.


//Node structure for a singly linked list

class Node<T> {
    
    var value: T
    var next: Node<T>?
    
    init(value: T, next: Node<T>? = nil) {
        self.value = value
        self.next = next
    } // assigned a default value of nil to the next parameter since ther might not be a next node
}


struct LinkedList<T> {
    
    var head: Node<T>?
    var tail: Node<T>?
    
    var isEmpty: Bool { head == nil }
    
    
    //push adds a node to the front of the list
    mutating func push(_ value: T) { //accepts a generic type and returns nothing
        
        head = Node(value: value, next: head) // we instantiate a node with value and head
        
        // if tail is nil, we assign the head to the tail
        if tail == nil {
            tail = head
        }
        self.print
    }
    
    
    // removes node from the front of the list
    mutating func pop() -> Node<T>? { // doesn't accept any parameters, returns a generic optional value
        
        defer { // defer is used for executing code right before exiting the scope that the statement is contained in.
            head = head?.next
            if isEmpty {
                tail = nil
            }
            self.print
        }
        return head // executed 1st because of defer statement
        
        // Sequence of pop() evenets:
        // 1. return head 2. defer statement
        
        // Explanation of pop() execution:
        // when we pop() the first time, defer will be called but its code block won’t be executed yet.
        
        //        so we return.head (which is the node with value 1). This is the node that is being popped off the list
        
        
        //        then the code block inside defer is run. The reason we use defer, is because we want to return the value of the previous head, before assigning a new node to it
        
        //        the next property of the first node is 2, so head is 2 now
        
        //        isEmpty is not nil (since head has a value) so this code block isn’t entered
        
        
        //        the last time we pop(), we have to set head and tail to nil. Since 3 is the last value, its next property is nil (thus head is set to nil)
        //        because head is nil, we enter the isEmpty code block and set tail to nil as well
        //
    }
    
    
    
    mutating func append(_ value: T) {
        let node = Node(value: value)
        tail?.next = node
        tail = node
        if isEmpty {
            head = tail
        }
        self.print
        
        //3 things append must do:
        //        1. Create a reference the node we are going to append
        //        2. Assign a new tail
        //        3. Consider the edge case of the list being empty
        
        //        Explanation of execution of append() :
        //        the first time we append, the list is empty. We instantiate a node with the value that was fed into the method
        //        the instantiated node is being assigned to the next property of the tail. But since there is no tail, the optionally chained tail will produce nil
        //        on line 5 a new tail is assigned (1).
        //        head is nil, so the isEmpty code block is entered
        //        head and tail are now the same
        //        the second time we append, tail?.next gets set to the node we created (2).
        //        This node is now the new tail
    }
    
    //removing a node from the end of a list
    mutating func removeLast() -> Node<T>? {
        
        guard let head = head else { return nil }
        guard head.next != nil else { return pop() }
        
        var newTail = head
        var currentNode = head
        
        while let next = currentNode.next {
            newTail = currentNode
            currentNode = next
        }
        
        newTail.next = nil
        tail = newTail
        self.print
        return currentNode
        
        //    Explanation:
        //    if the list is empty, return nil
        //    if there is just one node in the list, pop() it off
        //    a while loop iterates through the list with the .next property
        //    once the while loop finishes, set .next property to nil, assign new tail and return the node being removed
        //        when we use removeLast() the first time, head is not nil, because we pushed three values before.
        //        also, head.next is not nil
        //        we create two variables: newTail and currentNode. As their names suggest, we use one to assign the new tail to and currentNode is the node that will be removed and returned by the function
        //        newTail and currentNode get both set to the head node, which has a value of 1 (remember that we iterate from the beginning of the list)
        //        the while loop will run as long as currentNode.next is not nil
        //        during the first iteration of the loop, currentNode.next is 2, so the inner block of the loop is entered
        //        think about what we want to achieve: Our goal is to have access to both 1) the node before the last one and 2) the last node. The first one will be the new tail and the last one will be returned. This can be achieved by implementing a lag between currentNode and newTail. So the logic within the while loop should set currentNode (what will be removed) to be one node post newTail (what will be the new tail, duh)
        //        within the first iteration, newTail is set to 1 and currentNode to 2. First iteration completes
        //        currentNode.next is 3, so we enter the while block
        //        newTail is now 2
        //        currentNode is now 3. Second iteration completes
        //        currentNode.next is nil, so we break out of the loop
        //        newTail.next is set to nil. By doing this, we remove the last node
        //        tail is set to 2
        //        currentNode (3) is returned
        
    }
    
    // returns a node at a given index
    func node(at index: Int) -> Node<T>? {
        
        guard index >= 0 else { return nil }
        var current = head
        var counter = 0
        
        while current?.next != nil && counter < index {
            current = current?.next
            counter += 1
        }
        
        Swift.print(current?.value ?? "")
        return current
        
        
        
        
        
        //        guard statement protects the method from negative indices
        
        //        just as we iterated from the beginning of the list with the removeLast() method, we have to do the same here. This is why head is stored in current, which will be used in the while loop
        
        //        ask yourself how you would return the 736th node in a hypothetical giant linked list (or any node except the first and last one). Again, there are no indices to make use of. This can be done by incrementing a variable every time we pass a node in the list. We do this with current?.next (same way as removeLast())
        
        //        the break out condition of the while loop ensures quitting the loop once the desired index is reached
        
        //        guard statement is passed
        
        //        head is 1 and is stored in the variable current
        
        //        counter starts with 0
        
        //        the while condition is true so its code block is run (current?.next has a value and 0 < 1)
        
        //        in order to traverse the list, we do the same as we did before with removeLast(): we store the next node of current, which is 2, in current
        
        //        counter is 1, first iteration completes
        
        //        current?.next is 3 and the counter is equal to the index (both 1), so the while condition is false and we break out of the loop
        
        //        current is returned, which is the node with the value 2. For good measure we print the value of the node before we return
    }
    
    
    //delete node at given
    
    mutating func delete(at index: Int) -> Node<T>? {
        guard index >= 0 else { return nil }
        if index == 0 { return pop() }
        var previous: Node<T>?
        var current = head
        var counter = 0
        
        while current?.next != nil && counter < index {
            previous = current
            current = current?.next
            counter += 1
        }
        
        if current?.next == nil {
            return removeLast()
        }
        
        previous?.next = current?.next
        
        self.print
        return current
        
        //        We employ the same strategy just like with removeLast() with a few differences:
        
        //        with current.next we can iterate through the list
        //        by counting at which node we currently are, we can quit the while loop when we arrived at the desired node
        //        we implement a lag in the while code block
        //        if the last or the first nodes are deleted, we simply return removeLast() and pop()
        
        
        //        What happens when we delete node at index 1?
        
        //        guard statement and if condition are skipped
        //        current is 1
        //        while condition is true, so code block is entered
        //        previous is set to 1
        //        current is set to 2
        //        counter is incremented to 1
        //        first iteration completes
        
        //        on the second run the while condition is false because counter is equal to index (both 1), so the while loop breaks out
        //        we check whether there is a next node. If not, it means that the aim is to remove the last node of the list, which is why we can use our removeLast() method
        //        else, if there is no next node, we do previous?.next = current?.next
        //
    }
    
    
    
    // insert a node at a given index
    mutating func insert(data: T, at index: Int) {
        
        guard index >= 0 else { return }
        let newNode = Node(value: data)
        
        if index == 0 { self.push(data) } else {
            var previous = head
            var current = head
            
            for _ in 0..<index {
                previous = current
                current = current?.next
            }
            
            newNode.next = previous?.next
            
                if newNode.next == nil {
                    self.append(data)
                    return
                }
                previous?.next = newNode
                self.print
    }
        
// Explanation:
//        guard is skipped
//        instantiate a new node with the value that was fed into the function
//        if is skipped (index is 1)
//        previous is 1
//        current is 1
//        for loop is entered because 0..<1
//        previous is 1
//        current is 3( because current?.next is 3, the list looks like this 1 -> 3 prior to us using insert())
//        first iteration completes
//        for loop condition is false, loop breaks out
//        previous?.next is 3, which is set to the next property of newNode (which was nil before). The new node is 2, so now newNode.next gives us 2 -> 3
//        if the next property of newNode was nil, we would enter the code block and use our append() method
//        on line 18, the next property of previous is set to 2. The previous node has a value of 1. This means, previous?.next = newNode gives us 1 -> 2
//        the end result is 1 -> 2 -> 3
//        
        
}
    
    mutating func reverse() {
        
        var previousNode: Node<T>? = nil
        self.tail = self.node(at: 0)
        var currentNode = head
        var nextNode = head?.next
        
        while nextNode != nil {
            currentNode?.next = previousNode
            previousNode = currentNode
            currentNode = nextNode
            nextNode = currentNode?.next
        }

        currentNode?.next = previousNode
        
        head = currentNode
        self.print
        
//        Let’s go through the code: (with 1 -> 2 -> 3 as an example)
//
//        on line 3 we set the tail with the value of head
//        we create 3 variables: previousNode, currentNode, nextNode
//        previousNode is nil, currentNode is 1, and nextNode is 2
//        the while condition is true, since nextNode is not nil, so we enter the code block
//        previous is nil, so line 8 produces 1 -> nil
//        previousNode is now 1
//        currentNode is now 2
//        nextNode is now 3
//        as it becomes apparent, we are shifting our variables one node up through the list
//        first iteration completes
//        while condition is still true, because nextNode is not nil (it is 3)
//        since previousNode is 1 and currentNode is 2, line 8 will produce 2 -> 1
//        previousNode is now 2
//        currentNode is now 3
//        nextNode is now nil
//        second iteration completes
//        while condition is false, because nextNode is nil
//        line 13 produces 3 -> 2
//        we assign a new head
//        end result is 3 -> 2 -> 1
//        

    }
    
    public var print: String {
        var stringArray = "["
        guard var node = head else {
            Swift.print(stringArray + "]")
            return stringArray + "]" }
        while let next = node.next {
            stringArray += "\(node.value), "
            node = next
        }
        stringArray += "\(node.value)"
        Swift.print(stringArray + "]")
        return stringArray + "]"
    }
}

var linkedList = LinkedList<Any>()

linkedList.push(3) // [3]
linkedList.push(2) // [2, 3]
linkedList.push(1) // [1, 2, 3]

linkedList.pop() // [2, 3]
linkedList.pop() // [3]
linkedList.pop() // []

linkedList.head?.value // 1
linkedList.head?.next?.value // 2
linkedList.head?.next?.next?.value // 3

linkedList.append(6) // [6]
linkedList.append(7) // [6, 7]
linkedList.append(8) // [6, 7, 8]


linkedList.removeLast() // [6, 7]]
linkedList.removeLast() // [6]
linkedList.removeLast() // []

linkedList.append(1) // [1]
linkedList.append(2) // [1, 2]
linkedList.append(3) // [1, 2, 3]

linkedList.node(at: 0) // 1
linkedList.node(at: 1) // 2
linkedList.node(at: 2) // 3

linkedList.delete(at: 1) // [1, 3] -- deleted 2
linkedList.delete(at: 0) // [3] -- deleted 1

linkedList.append(6) // [3, 6]
linkedList.append(7) // [3, 6, 7]
linkedList.insert(data: 8, at: 3) // [3, 6, 7, 8]
linkedList.insert(data: 2, at: 0) // [2, 3, 6, 7, 8]


linkedList.reverse() // [8, 7, 6, 3, 2]



// when we first push a node, the list has neither a head or tail. When we push(3), the nodes next property we instantiate is nil. We assign this node to the head.

// the tail is still nil, so we assign the head to the tail.

// Both head and tail are 3

//when we add push(2), the instantiated node has a value of 2 and its next property is the head we assigned earlier (which is 3).

//right now 2 (head) -> 3 (tail)

//since tail isn’t nil, the code block isn’t entered notice how the push(_ value: T) method doesn’t change the tail once a tail is assigned via the first push

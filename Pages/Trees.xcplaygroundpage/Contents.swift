import Foundation

// Trees are hierarchal data structures with a single root node and several child nodes
// Binary trees have at most two child nodes per parent
// Each object in the tree holds it's own value (such as integer or string) as well as an array of it's children
// Common terminology when working with trees:
// 1. A root object is where your tree begins
// 2. A branch object is one part of your tree that has ore branches coming off of it
// 3. A leaf object is one part of your tree that has no branches coming off of it

// A root, branch and a leaf together are generally called "nodes" because they are all ultimately the same thing; a single value, plus an array of children.

//building a basic tree

final class Node<Value> {
    var value: Value
    private(set) var children: [Node]
    
    
    // (2) To get an accurate count for any part of our tree
    var count: Int {
        1 + children.reduce(0) {$0 + $1.count }
    }

    
    // two custom initializers
    init(_ value: Value) {
        self.value = value
        children = []
    }
    
    init(_ value: Value, children: [Node]) {
        self.value = value
        self.children = children
    }
    
    
    
    init(_ value: Value, @NodeBuilder builder: () -> [Node]) {
        self.value = value
        self.children = builder()
    }
    
    
    //simple method to add children externally
    func add(child: Node) {
        children.append(child)
    }
}


// (1) To compare one node against another, we can tell Swift that Node conforms to the Equatable protocol as long as the value type it’s storing also conforms to Equatable, and Thanks to conditional conformance, Swift will take care of the rest of the functionality for us, so we just write an empty extension.

extension Node: Equatable where Value: Equatable {
    static func ==(lhs: Node, rhs: Node) -> Bool {
        lhs.value == rhs.value && lhs.children == rhs.children
    }
}

extension Node: Hashable where Value: Hashable {
    func hash(into hasher: inout Hasher) {
        hasher.combine(value)
        hasher.combine(children)
    }
}

extension Node: Codable where Value: Codable { }

//find a specific node in the tree
extension Node where Value: Equatable {
    func find(_ value: Value)  -> Node? {
        if self.value == value {
            return self
        }
        
        for child in children {
            if let match = child.find(value) {
                return match
            }
        }
        return nil
    }
}



@resultBuilder
struct NodeBuilder {
    static func buildBlock<Value>(_ children: Node<Value>...) -> [Node<Value>] {
        children
    }
}


// creating nodes
//var jaylen = Node("Jaylen")
//var richie = Node("Richie")
//var chloe = Node("Chloe")
//var missy = Node("Missy")
//
//missy.add(child: richie)
//missy.add(child: jaylen)
//missy.add(child: chloe)
//
//print(missy)
//print(missy == chloe)
//print(missy != richie)
//print(missy == missy)
//
//print(missy.count)
//print(chloe.count)
//
//
//if let missy = missy.find("Missy") {
//    print(missy.count)
//}
//
//if let richie = missy.find("Richie") {
//    print(richie.count)
//}

//building trees with Node type fully upgraded using function builders
let missy = Node("Missy") {
    
    Node("Richie")
    Node("Jaylen")
    Node("Chloe") {
        Node("Chloe's child1")
        Node("Chloe's child2")
        Node("Chloe's child3")
    }
}

print(missy.count)
print(chloe.count)






// to make our tree more useful we need to add three things to it:

//1. The ability to compare nodes in the tree against each other, so we can tell if two nodes have the same value and children.
// 2. The ability to know the size of the tree, telling us how many items in total there are.
// 3.The ability to find a specific node in the tree, if it exists.

// Binary trees are suitable for various applications, including representing hierarchical data, searching, and sorting algorithms (e.g., binary search tree).

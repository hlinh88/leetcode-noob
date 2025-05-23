//
//  Tree.swift
//  
//
//  Created by Luke Nguyen on 3/4/25.
//

public class TreeNode {
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
    public init() { self.val = 0; self.left = nil; self.right = nil; }
    public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
    public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
        self.val = val
        self.left = left
        self.right = right
    }
}

// Function to build a tree from level-order array representation
func buildTree(_ arr: [Int?]) -> TreeNode? {
    guard !arr.isEmpty, let rootVal = arr[0] else { return nil }
    
    let root = TreeNode(rootVal)
    var queue: [TreeNode?] = [root]
    var i = 1
    
    while i < arr.count {
        let current = queue.removeFirst()
        
        if i < arr.count, let leftVal = arr[i] {
            let leftNode = TreeNode(leftVal)
            current?.left = leftNode
            queue.append(leftNode)
        }
        i += 1
        
        if i < arr.count, let rightVal = arr[i] {
            let rightNode = TreeNode(rightVal)
            current?.right = rightNode
            queue.append(rightNode)
        }
        i += 1
    }
    
    return root
}

// Helper function to determine tree depth
func getDepth(_ root: TreeNode?) -> Int {
    guard let root = root else { return 0 }
    return 1 + max(getDepth(root.left), getDepth(root.right))
}

// Print the tree with a better structure
func printTree(_ root: TreeNode?) {
    guard let root = root else {
        print("Empty Tree")
        return
    }
    
    var queue: [(TreeNode?, Int)] = [(root, 0)]
    let depth = getDepth(root)
    var levels: [[String]] = Array(repeating: [], count: depth)
    
    while !queue.isEmpty {
        let (node, level) = queue.removeFirst()
        if levels[level].isEmpty { levels[level] = [] }
        
        if let node = node {
            levels[level].append("\(node.val)")
            queue.append((node.left, level + 1))
            queue.append((node.right, level + 1))
        } else {
            levels[level].append(" ")
            queue.append((nil, level + 1))
            queue.append((nil, level + 1))
        }
    }
    
    // Remove trailing empty spaces for a cleaner print
    for i in 0..<levels.count {
        while levels[i].last == " " { levels[i].removeLast() }
    }

    // Print the tree
    let maxWidth = levels.last?.count ?? 1
    for i in 0..<levels.count {
        let space = String(repeating: " ", count: (maxWidth - levels[i].count) * 2)
        print(space + levels[i].joined(separator: "   "))
        
        if i < levels.count - 1 {
            var connections: [String] = []
            for j in 0..<levels[i].count {
                if levels[i][j] != " " {
                    connections.append("/")
                } else {
                    connections.append(" ")
                }
                
                if j < levels[i].count - 1 {
                    connections.append("\\")
                }
            }
            print(space + connections.joined(separator: "   "))
        }
    }
}


public class Node {
    public var val: Int
    public var children: [Node]
    
    public init(_ val: Int) {
        self.val = val
        self.children = []
    }
}

// Function to build an N-ary tree from level-order representation
func buildNAryTree(_ arr: [Any?]) -> Node? {
    guard !arr.isEmpty, let rootVal = arr[0] as? Int else { return nil }
    
    let root = Node(rootVal)
    var queue: [(Node, Int)] = [(root, 1)]  // (Parent Node, Index in Array)
    var i = 1
    
    while i < arr.count {
        let (parent, _) = queue.removeFirst()
        var children: [Node] = []
        
        while i < arr.count, let childVal = arr[i] as? Int {
            let childNode = Node(childVal)
            children.append(childNode)
            queue.append((childNode, i))
            i += 1
        }
        
        parent.children = children
        i += 1  // Skip nil separator
    }
    
    return root
}

// Function to print the N-ary tree level by level
func printNAryTree(_ root: Node?) {
    guard let root = root else {
        print("Empty Tree")
        return
    }
    
    var queue: [Node] = [root]
    
    while !queue.isEmpty {
        var levelValues: [String] = []
        let levelSize = queue.count
        
        for _ in 0..<levelSize {
            let node = queue.removeFirst()
            levelValues.append("\(node.val)")
            queue.append(contentsOf: node.children)
        }
        
        print(levelValues.joined(separator: " "))
    }
}

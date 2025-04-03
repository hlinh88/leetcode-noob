public class Node {
    public var val: Int
    public var children: [Node]
    public init(_ val: Int) {
        self.val = val
        self.children = []
    }
}

class Solution {
    func maxDepth(_ root: Node?) -> Int {
        guard let root = root else {
            return 0
        }
        
        var res = 0
        var count = 1
        
        func dfs(_ node: Node?) {
            guard let node = node else {
                res = max(res, count)
                return
            }
            
            if node.children.isEmpty {
                res = max(res, count)
                return
            }
            
            count += 1
            for child in node.children {
                dfs(child)
            }
            count -= 1
        }
        
        dfs(root)
        
        return res
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

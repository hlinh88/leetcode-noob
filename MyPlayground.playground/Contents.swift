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

// Function to print the tree level by level
func printTree(_ root: TreeNode?) {
    guard let root = root else {
        print("Empty Tree")
        return
    }
    
    var queue: [TreeNode?] = [root]
    
    while !queue.isEmpty {
        var levelNodes: [String] = []
        let levelSize = queue.count
        
        for _ in 0..<levelSize {
            let node = queue.removeFirst()
            if let node = node {
                levelNodes.append("\(node.val)")
                queue.append(node.left)
                queue.append(node.right)
            } else {
                levelNodes.append("null")
            }
        }
        
        print(levelNodes.joined(separator: " "))
    }
}

class Solution {
    func widthOfBinaryTree(_ root: TreeNode?) -> Int {
        guard let root = root else { return 0 }
        
        var res = 0
        var queue: [(TreeNode?, Int)] = [(root, 0)]
        
        while !queue.isEmpty {
            let levelSize = queue.count
            let firstIndex = queue.first!.1
            let lastIndex = queue.last!.1
            
            res = max(res, lastIndex - firstIndex + 1)
            
            for _ in 0..<levelSize {
                let (node, index) = queue.removeFirst()
                
                if let left = node?.left {
                    print("left: \((left.val, index * 2 + 1))")
                    queue.append((left, index * 2 + 1))
                }
                
                if let right = node?.right {
                    print("right: \((right.val, index * 2 + 2))")
                    queue.append((right, index * 2 + 2))
                }
            }
        }
        
        return res
    }
}

Solution().widthOfBinaryTree(buildTree([1,3,2,5,nil,nil,9,6,nil,7]))


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

func printTree(_ root: TreeNode?) {
    guard let root = root else { return }
    
    var queue: [TreeNode?] = [root]
    
    while !queue.isEmpty {
        let levelSize = queue.count
        var levelValues: [String] = []
        
        for _ in 0..<levelSize {
            let node = queue.removeFirst()
            if let node = node {
                levelValues.append("\(node.val)")
                queue.append(node.left)
                queue.append(node.right)
            } else {
                levelValues.append("nil")
            }
        }
        
        print(levelValues.joined(separator: " "))
    }
}

class Solution {
    func balanceBST(_ root: TreeNode?) -> TreeNode? {
        var arr: [TreeNode] = []
        
        func inorder(_ node: TreeNode?) {
            guard let node = node else { return }
            inorder(node.left)
            arr.append(node)
            inorder(node.right)
        }
        
        func buildTree(_ nodes: [TreeNode], _ start: Int, _ end: Int) -> TreeNode? {
            if start > end { return nil }
            let mid = (start + end) / 2
            let node = TreeNode(nodes[mid].val)
            node.left = buildTree(nodes, start, mid - 1)
            node.right = buildTree(nodes, mid + 1, end)
            return node
        }
        
        inorder(root)
        
        return buildTree(arr, 0, arr.count - 1)
    }
}

Solution().balanceBST(buildTree([1,nil,2,nil,3,nil,4,nil,nil]))

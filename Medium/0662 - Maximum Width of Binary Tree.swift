/**
 * Definition for a binary tree node.
 * public class TreeNode {
 *     public var val: Int
 *     public var left: TreeNode?
 *     public var right: TreeNode?
 *     public init() { self.val = 0; self.left = nil; self.right = nil; }
 *     public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
 *     public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
 *         self.val = val
 *         self.left = left
 *         self.right = right
 *     }
 * }
 */
class Solution {
    func widthOfBinaryTree(_ root: TreeNode?) -> Int {
        guard let root = root else { return 0 }
        
        var res = 0
        var queue: [(TreeNode?, Int)] = [(root, 0)]
        
        while !queue.isEmpty {
            let levelSize = queue.count
            let first = queue.first!
            let last = queue.last!
            
            res = max(res, last.1 - first.1 + 1)
            
            for _ in 0..<levelSize {
                let (node, index) = queue.remove(at: 0)
                // Prevent deep tree
                let normalIndex = index - first.1
                
                if let left = node?.left {
                    queue.append((left, normalIndex * 2 + 1))
                }
                
                if let right = node?.right {
                    queue.append((right, normalIndex * 2 + 2))
                }
            }
        }
        
        return res
    }
}
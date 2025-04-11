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
    func isBalanced(_ root: TreeNode?) -> Bool {
        func dfs(_ node: TreeNode?) -> (Bool, Int) {
            guard let node else {
                return (true, 0)
            }
            
            let left = dfs(node.left)
            let right = dfs(node.right)
            let balanced = abs(left.1 - right.1) <= 1 && left.0 && right.0
            
            return (balanced, max(left.1, right.1) + 1)
        }
        
        return dfs(root).0
    }
}

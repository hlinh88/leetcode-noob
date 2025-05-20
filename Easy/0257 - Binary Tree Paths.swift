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
    func binaryTreePaths(_ root: TreeNode?) -> [String] {
        guard let root = root else { return [] }
        
        var res: [String] = []

        func dfs(_ cur: String, _ node: TreeNode?) {
            guard let node else { return }

            if node.left == nil && node.right == nil {
                res.append(cur)
                return 
            }

            if let left = node.left {
                dfs(cur + "->\(left.val)", left)
            }

            if let right = node.right {
                dfs(cur + "->\(right.val)", right)
            }
        }

        dfs("\(root.val)", root)

        return res
    }
}
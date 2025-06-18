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
    func leafSimilar(_ root1: TreeNode?, _ root2: TreeNode?) -> Bool {
        func dfs(_ node: TreeNode?) -> [Int] {
            guard let node = node else { return [] }

            if node.left == nil && node.right == nil {
                return [node.val]
            }

            return dfs(node.left) + dfs(node.right)
        }

        return dfs(root1) == dfs(root2)
    }
}
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
    func maxPathSum(_ root: TreeNode?) -> Int {
        var maxSum = Int.min
        dfs(root, &maxSum)
        return maxSum
    }

    func dfs(_ root: TreeNode?, _ maxSum: inout Int) -> Int {
        guard let root = root else { return 0 }
        let left = max(dfs(root.left, &maxSum), 0)
        let right = max(dfs(root.right, &maxSum), 0)
        maxSum = max(maxSum, (root.val + left + right))
        return root.val + max(left, right)
    }
}
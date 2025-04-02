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

class Solution {
    func hasPathSum(_ root: TreeNode?, _ targetSum: Int) -> Bool {
        func dfs(_ node: TreeNode?, _ currentSum: Int) -> Bool {
            if node == nil {
                return false
            }
            
            if node?.left == nil && node?.right == nil {
                return currentSum == targetSum
            }
            
            return dfs(node?.left, currentSum + node!.val) ||
            dfs(node?.right, currentSum + node!.val)
        }
        
        return dfs(root, 0)
    }
}




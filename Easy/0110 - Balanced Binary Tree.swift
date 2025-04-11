// Binary Tree depth

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
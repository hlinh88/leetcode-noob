// LCA deepest leaves

class Solution {
    func lcaDeepestLeaves(_ root: TreeNode?) -> TreeNode? {
        var result: TreeNode?
        var maxDepth = 0
        
        func dfs(_ node: TreeNode?, _ depth: Int) -> Int {
            guard let node = node else { return depth }
            
            let d = depth + 1
            
            if node.left == nil && node.right == nil {
                if d > maxDepth {
                    result = node
                    maxDepth = d
                }
                
                return d
            }
            
            let left = dfs(node.left, d)
            let right = dfs(node.right, d)
            
            if left == maxDepth, right == maxDepth {
                result = node
            }
            
            return max(left, right)
        }
        
        dfs(root, 0)
        
        return result
    }
}
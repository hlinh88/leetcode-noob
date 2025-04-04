// Binary Search Tree -> [Min, Max]

class Solution {
    func isValidBST(_ root: TreeNode?) -> Bool {
        let max = Int32.max
        let min = Int32.min
        
        func dfs(_ node: TreeNode?, _ max: Int, _ min: Int) -> Bool {
            guard let node = node else { return true }
            
            let val = node.val
            
            if val < min || val > max {
                return false
            }
            
            return dfs(node.left, val - 1, min) && dfs(node.right, max, val + 1)
        }
        
        return dfs(root, Int(max), Int(min))
    }
}

Solution().isValidBST(buildTree([5,1,4,nil,nil,3,6]))

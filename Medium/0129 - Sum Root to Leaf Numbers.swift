// DFS

class Solution {
    func sumNumbers(_ root: TreeNode?) -> Int {
        var res = 0
        
        func dfs(_ node: TreeNode?, _ num: Int) {
            guard let node = node else {
                return
            }
            
            if node.left == nil && node.right == nil {
                let lastVal = num * 10 + node.val
                res += lastVal
            } else {
                dfs(node.left, num * 10 + node.val)
                dfs(node.right, num * 10 + node.val)
            }
            
            print("res: \(res), num: \(num)")
        }
        
        dfs(root, 0)
        
        return res
    }
}
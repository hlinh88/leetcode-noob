// DFS - Tree - Backtracking

class Solution {
    func pathSum(_ root: TreeNode?, _ targetSum: Int) -> [[Int]] {
        var result = [[Int]]()
        
        func dfs(_ node: TreeNode?, _ path: [Int], _ currentSum: Int) {
            guard let node else { return }
           
            if node.left == nil, node.right == nil {
                if currentSum + node.val == targetSum {
                    result.append(path + [node.val])
                    return
                }
            }
            
            dfs(node.left, path + [node.val], currentSum + node.val)
            dfs(node.right, path + [node.val], currentSum + node.val)
        }
        
        dfs(root, [], 0)
        
        print(result)
        return result
    }
}

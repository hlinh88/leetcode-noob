// BFS

class Solution {
    func minDepth(_ root: TreeNode?) -> Int {
        var queue: [(TreeNode?, Int)] = [(root, 1)]
        
        while !queue.isEmpty {
            let (node, depth) = queue.removeFirst()
            if node == nil {
                continue
            }
            if node?.left == nil && node?.right == nil {
                return depth
            }
            
            for child in [node?.left, node?.right] {
                queue.append((child, depth + 1))
            }
        }
        
        return 0
    }
}

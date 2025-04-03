// DFS 

public class Node {
    public var val: Int
    public var children: [Node]
    public init(_ val: Int) {
        self.val = val
        self.children = []
    }
}

class Solution {
    func maxDepth(_ root: Node?) -> Int {
        guard let root = root else {
            return 0
        }
        
        var res = 0
        var count = 1
        
        func dfs(_ node: Node?) {
            guard let node = node else {
                res = max(res, count)
                return
            }
            
            if node.children.isEmpty {
                res = max(res, count)
                return
            }
            
            count += 1
            for child in node.children {
                dfs(child)
            }
            count -= 1
        }
        
        dfs(root)
        
        return res
    }
}
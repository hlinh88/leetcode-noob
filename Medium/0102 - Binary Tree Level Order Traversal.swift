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
    func levelOrder(_ root: TreeNode?) -> [[Int]] {
        guard let root else { return [] }

        var res: [[Int]] = []
        var queue: [TreeNode?] = [root]
     
        while !queue.isEmpty {
            var current: [Int] = []
            var nodes: [TreeNode?] = []
            while !queue.isEmpty {
                let node = queue.removeFirst()
                if let node {
                    current.append(node.val)
                    nodes.append(node)
                }
            }

            res.append(current)
            
            for node in nodes {
                if let left = node?.left {
                    queue.append(left)
                }

                if let right = node?.right {
                    queue.append(right)
                }
            }
        }

        return res
    }
}


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
    func levelOrder(_ root: TreeNode?) -> [[Int]] {
        guard let root else { return [] }

        var res: [[Int]] = []
        var queue: [TreeNode] = [root]
        var i = 0 

        while i < queue.count {
            let levelSize = queue.count - i 
            var level: [Int] = [] 

            for _ in 0..<levelSize {
                let node = queue[i]
                i += 1
                level.append(node.val)
                if let left = node.left {
                    queue.append(left)
                }
                if let right = node.right {
                    queue.append(right)
                }
            }

            res.append(level)
        } 

        return res
    }
}
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
    func rangeSumBST(_ root: TreeNode?, _ low: Int, _ high: Int) -> Int {
        var res = 0
        var queue: [TreeNode?] = [root]
        
        while !queue.isEmpty {
            let node = queue.removeFirst()!
            let val = node.val
            
            if val < low {
                if let right = node.right {
                    queue.append(right)
                }
            } else if val > high {
                if let left = node.left {
                    queue.append(left)
                }
            } else {
                res += val
                if let left = node.left {
                    queue.append(left)
                }
                
                if let right = node.right {
                    queue.append(right)
                }
            }
        }
        
        return res
    }
}
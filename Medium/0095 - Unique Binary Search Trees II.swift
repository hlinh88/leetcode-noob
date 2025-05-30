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
    func generateTrees(_ n: Int) -> [TreeNode?] {
        func generate(_ left: Int, _ right: Int) -> [TreeNode?]  {
            var res: [TreeNode?] = []

            if left > right {
                return [nil]
            }

            for val in left...right {
                for leftTree in generate(left, val-1) {
                    for rightTree in generate(val+1, right) {
                        let root = TreeNode(val, leftTree, rightTree)
                        res.append(root)
                    }
                }
            }
            return res
        }
        
        return generate(1, n)
    }
}
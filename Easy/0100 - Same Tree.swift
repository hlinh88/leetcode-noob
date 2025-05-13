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
    func isSameTree(_ p: TreeNode?, _ q: TreeNode?) -> Bool {
        var arr1 = [Int?](), arr2 = [Int?]()
        var q1: [TreeNode?] = [p]
        var q2: [TreeNode?] = [q]

        while !q1.isEmpty {
            let node = q1.removeFirst()
            arr1.append(node?.val)
            if node != nil {
                q1.append(node?.left)
                q1.append(node?.right)
            }
        }

         while !q2.isEmpty {
            let node = q2.removeFirst()
            arr2.append(node?.val)
            if node != nil {
                q2.append(node?.left)
                q2.append(node?.right)
            }
        }

        guard arr1.count == arr2.count else { return false }
        for i in 0..<arr1.count {
            if arr1[i] != arr2[i] {
                return false 
            }
        }

        return true 
    }
}
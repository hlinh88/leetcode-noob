/**
 * Definition for a binary tree node.
 */

public class TreeNode {
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
    public init() { self.val = 0; self.left = nil; self.right = nil; }
    public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
    public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
        self.val = val
        self.left = left
        self.right = right
    }
}

class Solution {
    func constructFromPrePost(_ preorder: [Int], _ postorder: [Int]) -> TreeNode? {
        var stack = [TreeNode]()

        let root = TreeNode(preorder[0])
        stack.append(root)

        var i = 1
        var j = 0

        while i < preorder.count, j < postorder.count {

            let node = TreeNode(preorder[i])

            while let last = stack.last, last.val == postorder[j] {
                stack.removeLast()
                j += 1
            }

            let last = stack.last

            if last?.left == nil {
                last?.left = node
            } else {
                last?.right = node
            }

            stack.append(node)
            i += 1
        }

        return root
    }
}

Solution().constructFromPrePost([1,2,4,5,3,6,7], [4,5,2,6,7,3,1])

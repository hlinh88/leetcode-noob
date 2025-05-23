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

// Inorder traversal -> Left Node Right

class Solution {
    func inorderTraversal(_ root: TreeNode?) -> [Int] {
        var res: [Int] = []
        
        if let root = root {
            res += inorderTraversal(root.left)
            res.append(root.val)
            res += inorderTraversal(root.right)
        }
        
        print(res)
        return res
    }
}





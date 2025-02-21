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

class FindElements {
    private var values = Set<Int>()

    init(_ root: TreeNode?) {
        if let root = root {
            dfs(root, 0)
        }
    }

    func find(_ target: Int) -> Bool {
        return values.contains(target)
    }

    func dfs(_ node: TreeNode?, _ val: Int) {
        guard let node = node else { return }
        node.val = val
        values.insert(val)

//        print(node.val)
//        print(node.left?.val)
//        print(node.right?.val)
//        print(values)
//        print("-------")

        dfs(node.left, 2 * val + 1)
        dfs(node.right, 2 * val + 2)
    }
}

/**
 * Your FindElements object will be instantiated and called as such:
 */
let root = TreeNode(-1)
root.left = TreeNode(-1)
root.right = TreeNode(-1)
root.left?.left = TreeNode(-1)
root.left?.right = TreeNode(-1)
root.right?.left = TreeNode(-1)
root.right?.right = TreeNode(-1)

let obj = FindElements(root)
let ret_1: Bool = obj.find(3)




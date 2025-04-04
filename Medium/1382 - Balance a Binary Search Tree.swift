// Sorted nodes by inorder traversal
// Recursion mid node -> build left & right

class Solution {
    func balanceBST(_ root: TreeNode?) -> TreeNode? {
        var arr: [TreeNode] = []
        
        func inorder(_ node: TreeNode?) {
            guard let node = node else { return }
            inorder(node.left)
            arr.append(node)
            inorder(node.right)
        }
        
        func buildTree(_ nodes: [TreeNode], _ start: Int, _ end: Int) -> TreeNode? {
            if start > end { return nil }
            let mid = (start + end) / 2
            let node = TreeNode(nodes[mid].val)
            node.left = buildTree(nodes, start, mid - 1)
            node.right = buildTree(nodes, mid + 1, end)
            return node
        }
        
        inorder(root)
        
        return buildTree(arr, 0, arr.count - 1)
    }
}
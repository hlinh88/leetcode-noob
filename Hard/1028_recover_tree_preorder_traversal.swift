// We run a preorder depth-first search (DFS) on the root of a binary tree.

// At each node in this traversal, we output D dashes (where D is the depth of this node), then we output the value of this node.  If the depth of a node is D, the depth of its immediate child is D + 1.  The depth of the root node is 0.

// If a node has only one child, that child is guaranteed to be the left child.

// Given the output traversal of this traversal, recover the tree and return its root.

// Input: traversal = "1-2--3--4-5--6--7"
// Output: [1,2,5,3,4,6,7]

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
    func recoverFromPreorder(_ traversal: String) -> TreeNode? {
        var i = traversal.startIndex
        var stack = [(node: TreeNode, depth: Int)]()

        while i < traversal.endIndex {
            var depth = 0
            // Count the number of dashes to determine the depth
            while i < traversal.endIndex && traversal[i] == "-" {
                depth += 1
                i = traversal.index(after: i)
            }

            // Extract the value of the node
            var val = 0
            while i < traversal.endIndex && traversal[i].isNumber {
                val = val * 10 + traversal[i].wholeNumberValue!
                i = traversal.index(after: i)
            }

            let newNode = TreeNode(val)

            // Adjust the stack to maintain the correct depth level
            while !stack.isEmpty && stack.last!.depth >= depth {
                stack.removeLast()
            }

            // Attach the new node to its parent
            if let parent = stack.last?.node {
                if parent.left == nil {
                    parent.left = newNode
                } else {
                    parent.right = newNode
                }
            }

            // Add the new node with its depth to the stack
            stack.append((newNode, depth))
        }

        // The root of the tree is the first node in the stack
        return stack.first?.node
    }
}

Solution().recoverFromPreorder("1-2--3---4-5--6---7")

// Binary Search Tree - Mid

class Solution {
    func sortedArrayToBST(_ nums: [Int]) -> TreeNode? {
        guard !nums.isEmpty else { return nil }
        let midIndex = nums.count / 2
        let midValue = nums[midIndex]
        var result: TreeNode? = TreeNode(midValue)
        result?.left = sortedArrayToBST(Array(nums[0..<midIndex]))
        result?.right = sortedArrayToBST(Array(nums[midIndex+1..<nums.count]))
        
        return result
    }
}
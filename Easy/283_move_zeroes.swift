// Input: nums = [0,1,0,3,12]
// Output: [1,3,12,0,0]

class Solution {
    func moveZeroes(_ nums: inout [Int]) {
        var l = 0
        for r in 0..<nums.count {
            if nums[r] != 0 {
                nums.swapAt(l, r)
                l += 1
            }
        }
    }
}
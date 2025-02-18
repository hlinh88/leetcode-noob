//Input: nums = [2,3,1,1,4]
//Output: 2
//Explanation: The minimum number of jumps to reach the last index is 2. Jump 1 step from index 0 to 1, then 3 steps to the last index.

class Solution {
    func jump(_ nums: [Int]) -> Int {
        var res = 0
        var far = 0, end = 0

        for i in 0..<nums.count {
            if i > end {
                end = far
                res += 1
            }
            far = max(far, i + nums[i])
        }

        return res
    }
}

Solution().jump([2,3,1,1,4])

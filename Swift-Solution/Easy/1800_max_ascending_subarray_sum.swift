//Input: nums = [10,20,30,5,10,50]
//Output: 65
//Explanation: [5,10,50] is the ascending subarray with the maximum sum of 65.

class Solution {
    func maxAscendingSum(_ nums: [Int]) -> Int {
        guard nums.count > 0 else { return 0 }

        var res = nums[0]
        var cur = nums[0]

        for i in 1..<nums.count {
            if nums[i] > nums[i-1] {
                cur += nums[i]
            } else {
                cur = nums[i]
            }
            res = max(cur, res)
        }

        return res
    }
}

Solution().maxAscendingSum([10,20,30,5,10,50]);
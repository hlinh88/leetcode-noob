//Input: target = 7, nums = [2,3,1,2,4,3]
//Output: 2
//Explanation: The subarray [4,3] has the minimal length under the problem constraint.


class Solution {
    func minSubArrayLen(_ target: Int, _ nums: [Int]) -> Int {
        var res = Int.max
        var l = 0
        var sum = 0

        for r in 0..<nums.count {
            sum += nums[r]

            while sum >= target {
                res = min(res, r - l + 1)
                sum -= nums[l]
                l += 1
            }

        }

        if res == Int.max {
            return 0
        }

        return res
    }
}

Solution().minSubArrayLen(7, [2,3,1,2,4,3])
//Example 1:
//
//Input: nums = [1,4,3,3,2]
//
//Output: 2
//
//Explanation:
//
//The strictly increasing subarrays of nums are [1], [2], [3], [3], [4], and [1,4].
//
//The strictly decreasing subarrays of nums are [1], [2], [3], [3], [4], [3,2], and [4,3].
//
//Hence, we return 2.

class Solution {
    func longestMonotonicSubarray(_ nums: [Int]) -> Int {
        var res = 1
        var count = 1
        var state = 0

        for i in 0..<nums.count-1 {
            if nums[i] < nums[i+1] {
                if state == 1 {
                    count += 1
                } else {
                    count = 2
                    state = 1
                }
            }

            if nums[i] > nums[i+1] {
                if state == -1 {
                    count += 1
                } else {
                    count = 2
                    state = -1
                }
            }

            if nums[i] == nums[i+1] {
                state = 0
                count = 1
            }

            res = max(res, count)
            print("count: \(count), res: \(res), state: \(state)")
        }

        return res
    }
}

//Solution().longestMonotonicSubarray([3,2,1])
Solution().longestMonotonicSubarray([1,4,3,3,2])

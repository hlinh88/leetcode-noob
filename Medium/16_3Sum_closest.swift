// Input: nums = [-1,2,1,-4], target = 1
// Output: 2
// Explanation: The sum that is closest to the target is 2. (-1 + 2 + 1 = 2).

class Solution {
    func threeSumClosest(_ nums: [Int], _ target: Int) -> Int {
        var nums = nums.sorted()
        var res = nums[0] + nums[1] + nums[2] 
        var diff = abs(res - target)

        for i in 0..<nums.count - 2 {
            var l = i + 1, r = nums.count - 1

            while l < r {
                let total = nums[i] + nums[l] + nums[r]
                let curDiff = abs(total - target)

                if curDiff == 0 { 
                    return target 
                }

                if curDiff < diff {
                    res = total
                    diff = curDiff
                }

                if total < target {
                    l += 1
                } else {
                    r -= 1
                }
            }
        }

        return res
    }
}
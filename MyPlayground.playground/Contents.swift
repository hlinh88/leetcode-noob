import Foundation

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

Solution().minSubArrayLen(11, [1,1,1,1,1,1,1,1])


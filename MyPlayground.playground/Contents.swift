import Foundation

class Solution {
    func firstMissingPositive(_ nums: [Int]) -> Int {
        var nums = Set(nums)
        var res = 1
        
        while nums.contains(res) {
            res += 1
        }
        
        return res
    }
}

Solution().firstMissingPositive([3,4,-1,1])


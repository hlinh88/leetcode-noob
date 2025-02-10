import Foundation


class Solution {
    func countBadPairs(_ nums: [Int]) -> Int {
        var dict: [Int: Int] = [:]
        var count = 0
        
        for i in 0..<nums.count {
            dict[nums[i] - i, default: 0] += 1
            count += dict[nums[i] - i]! - 1
        }
        print(dict)
        
        return (nums.count * (nums.count - 1) / 2) - count
    }
}

Solution().countBadPairs([4,1,3,3])

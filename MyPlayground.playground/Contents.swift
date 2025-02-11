import Foundation


class Solution {
    func canJump(_ nums: [Int]) -> Bool {
        var goal = nums.count - 1
        
        for i in stride(from: nums.count - 1, through: 0, by: -1) {
            if i + nums[i] >= goal {
                goal = i
            }
        }
        
        return goal == 0
        
//        var maxReach = 0
//        for i in 0...nums.count-1 {
//            if i > maxReach {
//                return false
//            }
//            maxReach = max(maxReach,i+nums[i])
//        }
//        return true
    }
}

Solution().canJump([2,2,0,0,0])

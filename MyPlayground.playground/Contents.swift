import Foundation


class Solution {
    func removeDuplicates(_ nums: inout [Int]) -> Int {
        var cur = 1
        var count = 1
        
        while cur < nums.count {
            if nums[cur] == nums[cur-1] {
                if count == 2 {
                    nums.remove(at: cur)
                    continue
                }
                count += 1
            } else {
                count = 1
            }
            
            cur += 1
        }
        
        return nums.count
    }
}

var nums = [0,0,1,1,1,1,2,3,3]
Solution().removeDuplicates(&nums)

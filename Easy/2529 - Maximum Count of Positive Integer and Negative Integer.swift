// Input: nums = [-3,-2,-1,0,0,1,2]
// Output: 3
// Explanation: There are 2 positive integers and 3 negative integers. The maximum count among them is 3.

class Solution {
    func maximumCount(_ nums: [Int]) -> Int {
        var res = 0
        var lLower = 0, r = nums.count - 1
        
        while lLower <= r {
            var mid = lLower + (r - lLower) / 2
            
            if nums[mid] >= 0 {
                r = mid - 1
            } else {
                lLower = mid + 1
            }
        }
        
        var lUpper = lLower
        r = nums.count - 1
        while lUpper <= r {
            var mid = lUpper + (r - lUpper) / 2
            
            if nums[mid] == 0 {
                lUpper = mid + 1
            } else {
                r = mid - 1
            }
        }
    
        return max(lLower, nums.count - lUpper)
    }
}

Solution().maximumCount([-3,-2,-1,0,0,0,1,2])

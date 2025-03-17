// Input: nums = [3,2,3,2,2,2]
// Output: true
// Explanation: 
// There are 6 elements in nums, so they should be divided into 6 / 2 = 3 pairs.
// If nums is divided into the pairs (2, 2), (3, 3), and (2, 2), it will satisfy all the conditions.

class Solution {
    func divideArray(_ nums: [Int]) -> Bool {
        var dict: [Int: Int] = [:]
        
        for num in nums {
            dict[num, default: 0] += 1
        }
        
        for (_, value) in dict {
            if value % 2 != 0 {
                return false
            }
        }
        
        return true
    }
}
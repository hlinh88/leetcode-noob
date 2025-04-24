// Sliding Window

class Solution {
    func countCompleteSubarrays(_ nums: [Int]) -> Int {
        var totalDistinct = Set(nums).count
        var freq: [Int: Int] = [:]
        var res = 0
        var left = 0
        
        for right in 0..<nums.count {
            freq[nums[right], default: 0] += 1
           
            while freq.keys.count == totalDistinct {
                res += nums.count - right
                freq[nums[left], default: 1] -= 1
                if freq[nums[left]] == 0 {
                    freq.removeValue(forKey: nums[left])
                }
                left += 1
            }
        }
        
        return res
    }
}

Solution().countCompleteSubarrays([1, 3, 1, 2, 2])

// Slding Window

class Solution {
    func countGood(_ nums: [Int], _ k: Int) -> Int {
        var res = 0
        var n = nums.count
        var l = 0, r = 0
        var freq: [Int: Int] = [:]
        var pairs = 0
        
        while l < n {
            while r < n && pairs < k {
                freq[nums[r], default: 0] += 1
                if freq[nums[r], default: 0] >= 2 {
                    pairs += freq[nums[r], default: 0] - 1
                }
                r += 1
            }
            
            if pairs >= k {
                res += n - r + 1
            }
            
            print("freq: \(freq), l: \(l), r: \(r), pairs: \(pairs)")
            freq[nums[l], default: 0] -= 1
            if freq[nums[l], default: 0] >= 1 {
                pairs -= freq[nums[l], default: 0]
            }
            l += 1
        }
        
        return res
    }
}

Solution().countGood([2,1,3,1,2,2,3,3,2,2,1,1,1,3,1], 11)

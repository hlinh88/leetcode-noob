class Solution {
    func findMaxAverage(_ nums: [Int], _ k: Int) -> Double {
        var cur = 0
        for i in 0..<k {
            cur += nums[i]
        }
        var res = Double(cur)/Double(k)
        
        for i in k..<nums.count {
            cur += nums[i] - nums[i-k]
            res = max(res, Double(cur)/Double(k))
        }
        
        return res
    }
}
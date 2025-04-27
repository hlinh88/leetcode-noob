class Solution {
    func countSubarrays(_ nums: [Int]) -> Int {
        var res = 0
        var i = 2
        while i < nums.count {
            let ls = (nums[i-2] + nums[i]) * 2
            let rs = nums[i-1]
            if ls == rs {
                res += 1
            }
            
            i += 1
        }

        return res
    }
}

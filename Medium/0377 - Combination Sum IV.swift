// Dynamic Programming 

class Solution {
    func combinationSum4(_ nums: [Int], _ target: Int) -> Int {
        var dp: [Int: Int] = [:]
        dp[0] = 1
        
        return helper(nums, target, &dp)
    }
    
    func helper(_ nums: [Int], _ target: Int, _ dp: inout [Int: Int]) -> Int {
        if target < 0 { return 0 }
        if let ans = dp[target] { return ans }
        var ans = 0
        for num in nums {
            ans += helper(nums, target - num, &dp)
        }
        dp[target] = ans
        return ans
    }
}
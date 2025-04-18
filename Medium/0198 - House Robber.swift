// Dynamic Programming

class Solution {
    func rob(_ nums: [Int]) -> Int {
        var n = nums.count
        if n == 1 { return nums[0] }
        if n == 2 { return max(nums[0], nums[1])}
        
        var dp: [Int] = Array(repeating: 0, count: n)
        dp[0] = nums[0]
        dp[1] = max(nums[0], nums[1])
        
        for i in 2..<n {
            dp[i] = max(dp[i-1], dp[i-2] + nums[i])
        }
        
        return dp[n-1]
    }
}

Solution().rob([5, 3, 10, 10, 15, 7, 20])

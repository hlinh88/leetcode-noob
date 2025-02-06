//Example 1:
//
//Input: n = 2
//Output: 2
//Explanation: There are two ways to climb to the top.
//1. 1 step + 1 step
//2. 2 steps
//Example 2:
//
//Input: n = 3
//Output: 3
//Explanation: There are three ways to climb to the top.
//1. 1 step + 1 step + 1 step
//2. 1 step + 2 steps
//3. 2 steps + 1 step

class Solution {
    func climbStairs(_ n: Int) -> Int {
        var dp: [Int] = Array(repeating: 1, count: n + 1)
        dp[0] = 1
        dp[1] = 1

        for i in 2..<n+1 {
            dp[i] = dp[i-1] + dp[i-2]
        }

        return dp[n]
    }
}

Solution().climbStairs(4);
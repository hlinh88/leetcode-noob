class Solution {
    func numDistinct(_ s: String, _ t: String) -> Int {
        var s = Array(s), t = Array(t)
        var dp: [[Int]] = Array(repeating: Array(repeating: 0, count: t.count + 1), count: s.count + 1)
        
        for i in 0..<s.count+1 {
            dp[i][0] = 1
        }
        
        for i in 1..<s.count+1 {
            for j in 1..<t.count+1 {
                if s[i-1] == t[j-1] {
                    dp[i][j] = dp[i-1][j-1] + dp[i-1][j]
                } else {
                    dp[i][j] = dp[i-1][j]
                }
            }
        }
        
        return dp[s.count][t.count] 
    }
}

Solution().numDistinct("rabbbit", "rabbit")

// Dynamic Programming

class Solution {
    func wordBreak(_ s: String, _ wordDict: [String]) -> Bool {
        var dp: [Bool] = Array(repeating: false, count: s.count + 1)
        dp[s.count] = true
        var s = Array(s)
        
        for i in stride(from: s.count - 1, through: 0, by: -1) {
            for word in wordDict {
                if i + word.count <= s.count,
                    String(s[i..<i+word.count]) == word {
                    dp[i] = dp[i + word.count]
                }
                
                if dp[i] {
                    break
                }
            }
        }
        
        return dp[0]
    }
}

Solution().wordBreak("leetcode", ["leet", "code"])

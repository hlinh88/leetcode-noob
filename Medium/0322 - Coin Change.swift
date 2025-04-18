// Dynamic Programming

class Solution {
    func coinChange(_ coins: [Int], _ amount: Int) -> Int {
        var coins = coins.sorted()
        var dp = Array(repeating: Int.max, count: amount + 1)
        dp[0] = 0
        
        for i in 1..<amount+1 {
            for coin in coins {
                let diff = i - coin
                if diff < 0 {
                    break
                }
                
                if dp[diff] != Int.max {
                    dp[i] = min(dp[i], dp[diff] + 1)
                }
            }
        }
        
        return dp[amount] == Int.max ? -1 : dp[amount]
    }
}

Solution().coinChange([186,419,83,408], 6249)

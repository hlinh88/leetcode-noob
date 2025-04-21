// Dynamic programming - DPF + Caching

class Solution {
    func maxProfit(_ prices: [Int]) -> Int {
        var dp: [String: Int] = [:]
        
        func dfs(_ i: Int, _ buying: Bool) -> Int {
            if i >= prices.count {
                return 0
            }
            
            if let ans = dp["\(i)\(buying)"] {
                return ans
            }
            
            let cooldown = dfs(i + 1, buying)
            
            if buying {
                let buy = dfs(i + 1, !buying) - prices[i]
                dp["\(i)\(buying)"] = max(cooldown, buy)
            } else {
                let sell = dfs(i + 2, !buying) + prices[i]
                dp["\(i)\(buying)"] = max(cooldown, sell)
            }
            
            return dp["\(i)\(buying)"]!
        }
        
        return dfs(0, true)
    }
}

Solution().maxProfit([1,2,3,0,2])

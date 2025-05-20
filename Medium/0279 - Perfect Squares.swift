// Dynamic Programming

class Solution {
    func numSquares(_ n: Int) -> Int {
        var nums: [Int] = []
        var j = 1
        while j * j <= n {
            nums.append(j * j)
            j += 1
        }
        
        var dp: [Int] = Array(repeating: Int.max, count: n + 1)
        dp[0] = 0
        
        for i in 1...n {
            for num in nums {
                let diff = i - num
                if diff < 0 {
                    break
                }
                
                print("i: \(i), diff: \(diff), num: \(num)")
        
                if dp[diff] != Int.max {
                    dp[i] = min(dp[i], dp[diff] + 1)
                }
                print(dp)
            }
        }
        
        return dp[n]
    }
}

Solution().numSquares(12)

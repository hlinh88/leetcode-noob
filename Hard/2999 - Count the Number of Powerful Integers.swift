// Dynamic Programming

class Solution {
    func numberOfPowerfulInt(_ start: Int, _ finish: Int, _ limit: Int, _ s: String) -> Int {
        func count(_ val: Int) -> Int {
            let strVal = Array(String(val))
            let totalLen = strVal.count
            let suffixLen = s.count
            let prefixLen = totalLen - suffixLen

            if prefixLen < 0 {
                return 0
            }

            var dp = Array(repeating: Array(repeating: 0, count: 2),
                           count: prefixLen + 1)

            dp[prefixLen][0] = 1
            let suffixVal = String(strVal[prefixLen...])
            dp[prefixLen][1] = suffixVal >= s ? 1 : 0

            for i in stride(from: prefixLen - 1, through: 0, by: -1) {
                let digit = Int(String(strVal[i]))!

                dp[i][0] = (limit + 1) * dp[i + 1][0]

                if digit <= limit {
                    dp[i][1] = digit * dp[i + 1][0] + dp[i + 1][1]
                } else {
                    dp[i][1] = (limit + 1) * dp[i + 1][0]
                }
                
            }

            return dp[0][1]
        }

        return count(finish) - count(start - 1)
    }
}

Solution().numberOfPowerfulInt(1, 6000, 4, "124")

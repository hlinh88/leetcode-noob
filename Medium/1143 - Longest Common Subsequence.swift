//Input: text1 = "abcde", text2 = "ace"
//Output: 3
//Explanation: The longest common subsequence is "ace" and its length is 3.

class Solution {
    func longestCommonSubsequence(_ text1: String, _ text2: String) -> Int {
        var text1 = Array(text1), text2 = Array(text2)
        var dp: [[Int]] = Array(repeating: Array(repeating: 0, count: text2.count + 1),
                                count: text1.count + 1)

        for i in stride(from: text1.count - 1, to: -1, by: -1) {
            for j in stride(from: text2.count - 1, to: -1, by: -1) {
                if text1[i] == text2[j] {
                    dp[i][j] = 1 + dp[i + 1][j + 1]
                } else {
                    dp[i][j] = max(dp[i + 1][j], dp[i][j + 1])
                }

                for row in dp {
                    print(row)
                }
                print("--------")
            }
        }

        return dp[0][0]
    }
}

Solution().longestCommonSubsequence("abcde", "ace")

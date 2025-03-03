//Input: str1 = "abac", str2 = "cab"
//Output: "cabac"
//Explanation:
//str1 = "abac" is a subsequence of "cabac" because we can delete the first "c".
//str2 = "cab" is a subsequence of "cabac" because we can delete the last "ac".
//The answer provided is the shortest such string that satisfies these properties.

class Solution {
    func shortestCommonSupersequence(_ str1: String, _ str2: String) -> String {
        let lcs = Array(longestCommonSubsequence(str1, str2))
        var res = ""
        var str1 = Array(str1), str2 = Array(str2)
        var i = 0, j = 0


        // Find the prefix equal LCS
        for char in lcs {
            while i < str1.count && str1[i] != char {
                res += String(str1[i])
                i += 1
            }

            while j < str2.count && str2[j] != char {
                res += String(str2[j])
                j += 1
            }

            // Add LCS
            res += String(char)
            i += 1
            j += 1
        }

        // Find the suffix equal LCS
        res.append(contentsOf: str1.dropFirst(i))
        res.append(contentsOf: str2.dropFirst(j))

        print(res)


        return res
    }

    func longestCommonSubsequence(_ text1: String, _ text2: String) -> String {
        var text1 = Array(text1), text2 = Array(text2)
        var dp: [[String]] = Array(repeating: Array(repeating: "", count: text2.count + 1),
                                   count: text1.count + 1)

        for i in stride(from: text1.count - 1, to: -1, by: -1) {
            for j in stride(from: text2.count - 1, to: -1, by: -1) {
                if text1[i] == text2[j] {
                    dp[i][j] = String(text1[i]) + dp[i + 1][j + 1]
                } else {
                    print("dp[i+1][j] \(dp[i + 1][j]), dp[i][j+1] \(dp[i][j + 1])")
                    dp[i][j] = dp[i+1][j].count > dp[i][j + 1].count ? dp[i+1][j] : dp[i][j + 1]
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

Solution().shortestCommonSupersequence("abac", "cab")

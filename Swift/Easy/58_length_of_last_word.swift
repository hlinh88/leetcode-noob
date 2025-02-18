//Input: s = "   fly me   to   the moon  "
//Output: 4
//Explanation: The last word is "moon" with length 4.

class Solution {
    func lengthOfLastWord(_ s: String) -> Int {
        var res = 0
        for c in s.reversed() {
            if c != " " {
                res += 1
            } else {
                if res > 0 {
                    return res
                }
            }
        }

        return res
    }
}

Solution().lengthOfLastWord("   fly me   to   the moon  ")

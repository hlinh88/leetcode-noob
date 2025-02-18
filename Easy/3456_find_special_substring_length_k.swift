//The substring consists of only one distinct character (e.g., "aaa" or "bbb").
//If there is a character immediately before the substring, it must be different from the character in the substring.
//If there is a character immediately after the substring, it must also be different from the character in the substring.

class Solution {
    func hasSpecialSubstring(_ s: String, _ k: Int) -> Bool {
        let s = Array(s)
        var l = 0

        for i in 0..<s.count {
            if s[i] == s[l] {
                continue
            }

            if (i - l) == k {
                return true
            }

            l = i
        }

        return s.count - l == k
    }
}

Solution().hasSpecialSubstring("aaabaaa", 3)

// Input: s = "abca"
// Output: true
// Explanation: You could delete the character 'c'.

class Solution {
    func validPalindrome(_ s: String) -> Bool {
        var s = Array(s)
        var l = 0, r = s.count - 1

        while l < r {
            if s[l] != s[r] {
                return isPalindrome(Array(s[l + 1...r])) || isPalindrome(Array(s[l...r - 1]))
            }

            l += 1
            r -= 1
        }

        return true
    }

    func isPalindrome(_ s: [Character]) -> Bool {
        var l = 0, r = s.count - 1
        while l < r {
            print("L: \(l), R: \(r)")
            if s[l] != s[r] {
                return false
            }

            l += 1
            r -= 1
        }

        return true
    }
}

Solution().validPalindrome("ebcbbececabbacecbbcbe")

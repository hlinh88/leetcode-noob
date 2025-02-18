//Given two strings s and t, return true if t is an
//anagram
// of s, and false otherwise.
//
//
//
//Example 1:
//
//Input: s = "anagram", t = "nagaram"
//
//Output: true

class Solution {
    func isAnagram(_ s: String, _ t: String) -> Bool {
        if s.count != t.count {
            return false
        }

        var frequencyS: [Character: Int] = [:]
        var frequencyT: [Character: Int] = [:]

        for char in s {
            frequencyS[char, default: 0] += 1
        }

        for char in t {
            frequencyT[char, default: 0] += 1
        }

        return frequencyS == frequencyT
    }
}
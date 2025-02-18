//Given two strings ransomNote and magazine, return true if ransomNote can be constructed by using the letters from magazine and false otherwise.
//
//Each letter in magazine can only be used once in ransomNote.

class Solution {
    func canConstruct(_ ransomNote: String, _ magazine: String) -> Bool {
        var dict: [Character: Int] = [:]

        for char in magazine {
            dict[char, default: 0] += 1
        }

        for char in ransomNote {
            if let val = dict[char] {
                dict[char]! -= 1
                if dict[char] == 0 {
                    dict[char] = nil
                }
            } else {
                return false
            }
        }

        return true
    }
}

Solution().canConstruct("aa", "aab")
//Input: pattern = "abba", s = "dog cat cat dog"
//
//Output: true
//
//Explanation:
//
//The bijection can be established as:
//
//'a' maps to "dog".
//'b' maps to "cat".

class Solution {
    func wordPattern(_ pattern: String, _ s: String) -> Bool {
        var s = s.split(separator: " ")
        if pattern.count != s.count {
            return false
        }
        var dict: [Character: String] = [:]

        for (i, c) in pattern.enumerated() {
            if let value = dict[c] {
                if value != String(s[i]) {
                    return false
                }
            } else {
                if dict.values.contains(String(s[i])) {
                    return false
                }
                dict[c] = String(s[i])
            }
            print(dict)
        }

        return true
    }
}

Solution().wordPattern("abba", "dog dog dog dog")
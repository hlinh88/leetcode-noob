//Input: s = "egg", t = "add"
//
//Output: true
//
//Explanation:
//
//The strings s and t can be made identical by:
//
//Mapping 'e' to 'a'.
//Mapping 'g' to 'd'.

// Hashmap -> Same as Word Pattern

class Solution {
    func isIsomorphic(_ s: String, _ t: String) -> Bool {
        var s = Array(s), t = Array(t)
        var dict: [Character: Character] = [:]
        for i in 0..<s.count {
            if let c = dict[s[i]] {
                if c != t[i] {
                    return false
                }
            } else {
                if dict.values.contains(t[i]) {
                    return false
                }
                dict[s[i]] = t[i]
            }
        }

        return true
    }
}

Solution().isIsomorphic("egg", "add")

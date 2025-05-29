class Solution {
    func longestPalindrome(_ s: String) -> Int {
        var freq: [Character: Int] = [:]
        
        for c in s {
            freq[c, default: 0] += 1
        }
        
        var res = 0
        for (k, v) in freq {
            res += v / 2 * 2
            freq[k]! -= v / 2 * 2
            if freq[k, default: 0] <= 0 {
                freq.removeValue(forKey: k)
            }
        }
        
        if !freq.isEmpty {
            res += 1
        }
        
        return res 
    }
}
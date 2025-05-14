class Solution {
    func findTheDifference(_ s: String, _ t: String) -> Character {
        var freq: [Character: Int] = [:]
        
        for c in t {
            freq[c, default: 0] += 1
        }
        
        for c in s {
            freq[c, default: 0] -= 1
            if freq[c] == 0 {
                freq[c] = nil
            }
        }
        
        return freq.first!.key
    }
}
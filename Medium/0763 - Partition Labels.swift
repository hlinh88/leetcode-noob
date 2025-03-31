// Input: s = "ababcbacadefegdehijhklij"
// Output: [9,7,8]
// Explanation:
// The partition is "ababcbaca", "defegde", "hijhklij".
// This is a partition so that each letter appears in at most one part.
// A partition like "ababcbacadefegde", "hijhklij" is incorrect, because it splits s into less parts.

class Solution {
    func partitionLabels(_ s: String) -> [Int] {
        var lastIndex: [Character: Int] = [:]
        
        for (i, c) in s.enumerated() {
            lastIndex[c, default: i] = i
        }
        
        var result: [Int] = []
        var start = 0
        var end = 0
        
        for (i, c) in s.enumerated() {
            end = max(end, lastIndex[c]!)
            if i == end {
                result.append(i - start + 1)
                start = i + 1
            }
        }
        
        return result
    }
}
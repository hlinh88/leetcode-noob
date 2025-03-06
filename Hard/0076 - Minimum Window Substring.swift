// Input: s = "ADOBECODEBANC", t = "ABC"
// Output: "BANC"
// Explanation: The minimum window substring "BANC" includes 'A', 'B', and 'C' from string t.

class Solution {
    func minWindow(_ s: String, _ t: String) -> String {
        // 1: tCount dict chars
        // 2: L, R pointers
        // 3: If windowCount chars includes tCount -> count == tCount.count -> Set minLen = R - L + 1 -> Set leftPos
        // 4: Move L pointer to minimize the range while count == tCount.count otherwise move R pointer
        // 5: Return range leftPos -> leftPos + minLen
        guard !t.isEmpty, !s.isEmpty else { return "" }
        
        var tCount: [Character: Int] = [:]
        for c in t { tCount[c, default: 0] += 1 }
        
        var windowCount: [Character: Int] = [:]
        var left = 0, right = 0, count = 0
        var sArr = Array(s)
        var minLen = Int.max
        var leftPos = 0
        
        while right < sArr.count {
            let char = sArr[right]
            windowCount[char, default: 0] += 1
            
            if let tCount = tCount[char], windowCount[char] == tCount {
                count += 1
            }
            
            while count == tCount.count {
                if right - left + 1 < minLen {
                    minLen = right - left + 1
                    leftPos = left
                }
                
                let lChar = sArr[left]
                windowCount[lChar, default: 0] -= 1
                
                if let tCount = tCount[lChar], windowCount[lChar]! < tCount {
                    count -= 1
                }
                
                left += 1
            }
            
            right += 1
        }
        
        return minLen == Int.max ? "" : String(sArr[leftPos..<leftPos+minLen])
    }
}

Solution().minWindow("ADOBECODEBANC", "ABC")

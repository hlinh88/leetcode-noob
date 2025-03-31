class Solution {
    func partitionLabels(_ s: String) -> [Int] {
        var lastIndex: [Character: Int] = [:]
        
        for (i, c) in s.enumerated() {
            lastIndex[c, default: i] = i
        }
        
        print(lastIndex)
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

Solution().partitionLabels("ababcbacadefegdehijhklij")

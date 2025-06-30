class Solution {
    func findLHS(_ nums: [Int]) -> Int {
        var map: [Int: Int] = [:]
        var maxLength = 0
        for num in nums {
            map[num, default: 0] += 1
        }
        for (key, value) in map {
            if let nextKey = map[key + 1] {
                maxLength = max(maxLength, value + nextKey)
            }
        }
        
        return maxLength
    }
}
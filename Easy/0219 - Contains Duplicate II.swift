class Solution {
    func containsNearbyDuplicate(_ nums: [Int], _ k: Int) -> Bool {
        var map: [Int: [Int]] = [:]
        
        for (index, num) in nums.enumerated() {
            map[num, default: []].append(index)
        }
        
        for (_, indices) in map where indices.count > 1 {
            for i in 1..<indices.count {
                if indices[i] - indices[i-1] <= k {
                    return true
                }
            }
        }
        
        return false
    }
}
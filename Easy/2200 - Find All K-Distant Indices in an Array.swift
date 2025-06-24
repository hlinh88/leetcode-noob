class Solution {
    func findKDistantIndices(_ nums: [Int], _ key: Int, _ k: Int) -> [Int] {
        var ans: [Int] = []
        var keys: [Int] = []
        for i in 0..<nums.count {
            if nums[i] == key {
                keys.append(i)
            }
        }
        
        if keys.isEmpty { return ans }
        
        for i in 0..<nums.count {
            for j in keys {
                if abs(i-j) <= k {
                    ans.append(i)
                    break
                }
            }
        }
        
        return ans
    }
}
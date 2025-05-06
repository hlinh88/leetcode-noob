class Solution {
    func buildArray(_ nums: [Int]) -> [Int] {
        var result: [Int] = Array(repeating: 0, count: nums.count)
        
        for i in 0..<nums.count {
            result[i] = nums[nums[i]]
        }
        
        return result
    }
}
class Solution {
    func partitionArray(_ nums: [Int], _ k: Int) -> Int {
        var nums = nums.sorted()
        var result = 1
        var cur = nums[0]
        
        for i in 1..<nums.count {
            if nums[i] - cur > k {
                result += 1
                cur = nums[i]
            }
        }
        
        return result
    }
}
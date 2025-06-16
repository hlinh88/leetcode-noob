class Solution {
    func maximumDifference(_ nums: [Int]) -> Int {
        var result = -1

        for i in 0..<nums.count {
            for j in i+1..<nums.count {
                guard nums[j] > nums[i] else { continue }
                result = max(nums[j] - nums[i], result)
            }
        }

        return result
    }
}
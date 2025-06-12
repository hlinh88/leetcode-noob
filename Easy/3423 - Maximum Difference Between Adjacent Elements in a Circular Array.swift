class Solution {
    func maxAdjacentDistance(_ nums: [Int]) -> Int {
        var result = Int.min 

        for i in 0..<nums.count {
            var diff = nums[i] - nums[i+1]
            if i == nums.count-1 {
                diff = nums[i] - nums[0]
            }
            let val = abs(diff)
            result = max(val, result)
        }

        return result
    }
}
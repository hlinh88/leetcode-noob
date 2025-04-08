// Dynamic Programming

class Solution {
    func canPartition(_ nums: [Int]) -> Bool {
        let sum = nums.reduce(0, +)
        if sum % 2 != 0 { return false }
        
        let target = sum / 2
        var dp: Set<Int> = []
        dp.insert(0)

        for num in nums {
            var nextDP = dp
            for s in dp {
                if s + num == target {
                    return true 
                }
                nextDP.insert(s + num)
            }
            dp = nextDP
        }

        return dp.contains(target)
    }
}

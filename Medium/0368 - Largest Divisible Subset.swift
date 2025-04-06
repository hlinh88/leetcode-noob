// Dynamic programming

class Solution {
    func largestDivisibleSubset(_ nums: [Int]) -> [Int] {
        var nums = nums.sorted()
        var dp = Array(repeating: [] as [Int], count: nums.count)
        var res: [Int] = []

        for i in stride(from: nums.count-1, to: -1, by: -1) {
            for j in i..<nums.count {
                if nums[j] % nums[i] == 0 {
                    var temp: [Int] = [nums[i]] + dp[j]
                    if temp.count > dp[i].count {
                        dp[i] = temp
                    }
                }
            }

            if dp[i].count > res.count {
                res = dp[i]
            }
        }

        return res
    }
}

Solution().largestDivisibleSubset([1, 2, 5, 15, 45])

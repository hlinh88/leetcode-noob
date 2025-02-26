//Input: nums = [2,-5,1,-4,3,-2]
//Output: 8
//Explanation: The subarray [-5,1,-4] has absolute sum = abs(-5+1-4) = abs(-8) = 8.

// Kadane algorithm

class Solution {
    func maxAbsoluteSum(_ nums: [Int]) -> Int {
        var maxSum = 0
        var minSum = 0
        var currentMaxSum = 0
        var currentMinSum = 0

        for num in nums {
            currentMaxSum += num
            currentMinSum += num

            maxSum = max(maxSum, currentMaxSum)
            minSum = min(currentMinSum, minSum)

            if currentMaxSum < 0 {
                currentMaxSum = 0
            }

            if currentMinSum > 0 {
                currentMinSum = 0
            }

            print("currentMaxSum: \(currentMaxSum), currentMinSum: \(currentMinSum), maxSum: \(maxSum), minSum: \(minSum)")
        }

        let result = max(maxSum, abs(minSum))
        return result
    }
}

Solution().maxAbsoluteSum([2,-5,1,-4,3,-2])

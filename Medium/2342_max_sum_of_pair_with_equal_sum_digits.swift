//Input: nums = [18,43,36,13,7]
//Output: 54
//Explanation: The pairs (i, j) that satisfy the conditions are:
//- (0, 2), both numbers have a sum of digits equal to 9, and their sum is 18 + 36 = 54.
//- (1, 4), both numbers have a sum of digits equal to 7, and their sum is 43 + 7 = 50.
//So the maximum sum that we can obtain is 54.

class Solution {
    func maximumSum(_ nums: [Int]) -> Int {
        var res = -1
        var dict: [Int: [Int]] = [:]

        for num in nums {
            var calNum = num
            var total = 0
            while calNum > 0 {
                total += calNum % 10
                calNum /= 10
            }

            dict[total, default: []].append(num)
        }

        for value in dict.values {
            var value = value
            if value.count > 1 {
                value.sort()
                res = max(res, value[value.count - 1] + value[value.count - 2])
            }
        }

        return res
    }
}

Solution().maximumSum([18,43,36,13,7])

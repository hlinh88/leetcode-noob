//Example 1:
//
//Input: nums = [4,1,3,3]
//Output: 5
//Explanation: The pair (0, 1) is a bad pair since 1 - 0 != 1 - 4.
//The pair (0, 2) is a bad pair since 2 - 0 != 3 - 4, 2 != -1.
//The pair (0, 3) is a bad pair since 3 - 0 != 3 - 4, 3 != -1.
//The pair (1, 2) is a bad pair since 2 - 1 != 3 - 1, 1 != 2.
//The pair (2, 3) is a bad pair since 3 - 2 != 3 - 3, 1 != 0.
//There are a total of 5 bad pairs, so we return 5.

// i - j = nums[i] - nums[j] -> nums[i] - i = nums[j] - j
class Solution {
    func countBadPairs(_ nums: [Int]) -> Int {
        var dict: [Int: Int] = [:]
        var count = 0

        for i in 0..<nums.count {
            dict[nums[i] - i, default: 0] += 1
            count += dict[nums[i] - i]! - 1
        }
        print(dict)

        return (nums.count * (nums.count - 1) / 2) - count
    }
}

Solution().countBadPairs([4,1,3,3])
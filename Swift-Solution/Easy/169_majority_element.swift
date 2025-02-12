//Example 1:
//
//Input: nums = [3,2,3]
//Output: 3
//Example 2:
//
//Input: nums = [2,2,1,1,1,2,2]
//Output: 2

class Solution {
    func majorityElement(_ nums: [Int]) -> Int {
        var dict: [Int: Int] = [:]
        for num in nums {
            dict[num, default: 0] += 1
        }

        return dict.first { $0.value > nums.count / 2 }?.key ?? 0
    }
}

Solution().majorityElement([2,2,1,1,1,2,2])

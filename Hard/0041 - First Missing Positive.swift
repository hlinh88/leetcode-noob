//Given an unsorted integer array nums. Return the smallest positive integer that is not present in nums.
//
//You must implement an algorithm that runs in O(n) time and uses O(1) auxiliary space.
//
//
//
//Example 1:
//
//Input: nums = [1,2,0]
//Output: 3
//Explanation: The numbers in the range [1,2] are all in the array.

class Solution {
    func firstMissingPositive(_ nums: [Int]) -> Int {
        var nums = Set(nums)
        var res = 1

        while nums.contains(res) {
            res += 1
        }

        return res
    }
}

Solution().firstMissingPositive([3,4,-1,1])
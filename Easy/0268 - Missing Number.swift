//Input: nums = [3,0,1]
//
//Output: 2
//
//Explanation:
//
//n = 3 since there are 3 numbers, so all numbers are in the range [0,3]. 2 is the missing number in the range since it does not appear in nums.


class Solution {
    func missingNumber(_ nums: [Int]) -> Int {
        let sumRange = (0..<nums.count+1).reduce(0, +)
        let sumNums = nums.reduce(0, +)

        return sumRange - sumNums
    }
}

Solution().missingNumber([9,6,4,2,3,5,7,0,1])

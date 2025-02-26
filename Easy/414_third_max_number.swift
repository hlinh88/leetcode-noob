//Input: nums = [3,2,1]
//Output: 1
//Explanation:
//The first distinct maximum is 3.
//The second distinct maximum is 2.
//The third distinct maximum is 1.


class Solution {
    func thirdMax(_ nums: [Int]) -> Int {
        let nums = Array(Set(nums)).sorted(by: >)
        guard nums.count >= 3 else {
            return nums.first ?? 0
        }

        return nums[2]
    }
}

Solution().thirdMax([3,2,2,5,10,1])

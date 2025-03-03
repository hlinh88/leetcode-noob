//Input: nums = [2,7,11,15], target = 9
//Output: [0,1]
//Explanation: Because nums[0] + nums[1] == 9, we return [0, 1].

class Solution {
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        var dict = [Int: Int]()

        for (index, value) in nums.enumerated() {
            if let otherIndex = dict[value] {
                return [otherIndex, index]
            } else {
                dict[target - value] = index
            }
            print(dict)
        }

        return []
    }
}

Solution().twoSum([3, 2, 4], 6)


//Input: nums = [1,2,3,4,5,6,7], k = 3
//Output: [5,6,7,1,2,3,4]
//Explanation:
//rotate 1 steps to the right: [7,1,2,3,4,5,6]
//rotate 2 steps to the right: [6,7,1,2,3,4,5]
//rotate 3 steps to the right: [5,6,7,1,2,3,4]

class Solution {
    func rotate(_ nums: inout [Int], _ k: Int) {
        var k = k % nums.count
        nums = Array(nums[nums.count - k..<nums.count] + nums[0..<nums.count - k])
    }
}

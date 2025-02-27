//Input: nums = [3,4,5,1,2]
//Output: 1
//Explanation: The original array was [1,2,3,4,5] rotated 3 times.

class Solution {
    func findMin(_ nums: [Int]) -> Int {
        var l = 0, r = nums.count - 1

        while l < r {
            var mid = (l + r) / 2
            if nums[mid] > nums[r] {
                l = mid + 1
            } else {
                r = mid
            }
        }

        return nums[l]
    }
}
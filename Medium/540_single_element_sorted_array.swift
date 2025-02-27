//Input: nums = [1,1,2,3,3,4,4,8,8]
//Output: 2

class Solution {
    func singleNonDuplicate(_ nums: [Int]) -> Int {
        var l = 0, r = nums.count - 1

        while l < r {
            var mid = (l + r) / 2
            mid &= ~1
            print("L: \(l), R: \(r), M: \(mid), nums[mid]: \(nums[mid])")

            if nums[mid] == nums[mid + 1] {
                l = mid + 2
            } else {
                r = mid
            }
        }

        return nums[l]
    }
}

Solution().singleNonDuplicate([1,1,2,3,3,4,4,8,8])

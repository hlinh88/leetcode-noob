//Input: nums = [4,5,6,7,0,1,2], target = 0
//Output: 4


class Solution {
    func search(_ nums: [Int], _ target: Int) -> Int {
        var left = 0, right = nums.count - 1

        while left < right {
            var mid = (left + right) / 2
            if nums[mid] > nums[right] {
                left = mid + 1
            } else {
                right = mid
            }
        }

        var pivot = left
        left = 0
        right = nums.count - 1

        if target >= nums[pivot] && target <= nums[right] {
            left = pivot
        } else {
            right = pivot - 1
        }

        while left <= right {
            var mid = (left + right) / 2
            if nums[mid] == target {
                return mid
            } else if nums[mid] < target {
                left = mid + 1
            } else {
                right = mid - 1
            }
        }

        return -1
    }
}

Solution().search([4,5,6,7,0,1,2], 3)

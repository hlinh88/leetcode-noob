//Given a sorted array of distinct integers and a target value, return the index if the target is found. If not, return the index where it would be if it were inserted in order.
//
//You must write an algorithm with O(log n) runtime complexity.
//
//
//
//Example 1:
//
//Input: nums = [1,3,5,6], target = 5
//Output: 2


class Solution {
    func searchInsert(_ nums: [Int], _ target: Int) -> Int {
        var l = 0, r = nums.count

        while l < r {
            let mid = (l + r) / 2
            if nums[mid] < target {
                l = mid + 1
            } else {
                r = mid
            }

            print("L: \(l), R: \(r)")
        }

        return l
    }
}

Solution().searchInsert([1,3,5,6], 5)

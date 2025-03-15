// Binary Search - Hard af -> Would rather do backtracking

class Solution {
    func minCapability(_ nums: [Int], _ k: Int) -> Int {
        var left = nums.min()!, right = nums.max()!
        var res = 0

        while left <= right {
            let mid = left + (right - left) / 2
            var i = 0, count = 0

            while i < nums.count {
                if nums[i] <= mid {
                    count += 1
                    i += 2
                } else {
                    i += 1
                }
            }

            if count >= k {
                res = mid
                right = mid - 1
            } else {
                left = mid + 1
            }

        }

        return res
    }
}
//Input: nums = [1,4,3,2]
//Output: 4
//Explanation: All possible pairings (ignoring the ordering of elements) are:
//1. (1, 4), (2, 3) -> min(1, 4) + min(2, 3) = 1 + 2 = 3
//2. (1, 3), (2, 4) -> min(1, 3) + min(2, 4) = 1 + 2 = 3
//3. (1, 2), (3, 4) -> min(1, 2) + min(3, 4) = 1 + 3 = 4
//So the maximum possible sum is 4.

class Solution {
    func arrayPairSum(_ nums: [Int]) -> Int {
        var res = 0
        var nums = nums.sorted()
        var i = 0, j = 1
        while j <= nums.count - 1 {
            res += min(nums[i], nums[j])
            i += 2
            j += 2
        }

        return res
    }
}

Solution().arrayPairSum([6,2,6,5,1,2])

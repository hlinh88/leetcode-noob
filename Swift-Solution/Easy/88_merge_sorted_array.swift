//Input: nums1 = [1,2,3,0,0,0], m = 3, nums2 = [2,5,6], n = 3
//Output: [1,2,2,3,5,6]
//Explanation: The arrays we are merging are [1,2,3] and [2,5,6].
//The result of the merge is [1,2,2,3,5,6] with the underlined elements coming from nums1.

class Solution {
    func merge(_ nums1: inout [Int], _ m: Int, _ nums2: [Int], _ n: Int) {
        var pos = m + n - 1
        var i = m - 1
        var j = n - 1

        while j >= 0 {
            if i >= 0 && nums1[i] > nums2[j] {
                nums1[pos] = nums1[i]
                i -= 1
            } else {
                nums1[pos] = nums2[j]
                j -= 1
            }
            pos -= 1
        }
    }
}

var nums = [1]
Solution().merge(&nums, 1, [], 0)
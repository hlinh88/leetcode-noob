//Input: nums1 = [4,9,5], nums2 = [9,4,9,8,4]
//Output: [9,4]
//Explanation: [4,9] is also accepted.

class Solution {
    func intersection(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
        // var nums1 = Array(Set(nums1)), nums2 = Array(Set(nums2))
        // return nums1.filter { nums2.contains($0) }
        var nums1 = Array(Set(nums1)), nums2 = Array(Set(nums2))

        for num in nums1 {
            if !nums2.contains(num) {
                nums1.removeAll { $0 == num }
            }
        }

        return nums1
    }
}

Solution().intersection([4,9,5], [9,4,9,8,4])

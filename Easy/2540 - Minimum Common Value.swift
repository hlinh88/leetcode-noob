class Solution {
    func getCommon(_ nums1: [Int], _ nums2: [Int]) -> Int {
        var l = 0, r = 0

        while l < nums1.count, r < nums2.count {
            if nums1[l] == nums2[r] {
                return nums1[l]
            } else if nums1[l] < nums2[r] {
                l += 1
            } else {
                r += 1
            }
        }
        
        return -1
    }
}
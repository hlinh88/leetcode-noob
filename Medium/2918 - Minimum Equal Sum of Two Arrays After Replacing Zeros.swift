class Solution {
    func minSum(_ nums1: [Int], _ nums2: [Int]) -> Int {
        var sum1 = 0, sum2 = 0
        var zero1 = 0, zero2 = 0

        for num in nums1 {
            sum1 += num 
            if num == 0 {
                sum1 += 1
                zero1 += 1
            }
        }

        for num in nums2 {
            sum2 += num
            if num == 0 {
                sum2 += 1
                zero2 += 1
            }
        }

        if zero1 == 0, sum2 > sum1 {
            return -1
        }

        if zero2 == 0, sum1 > sum2 {
            return -1
        }

        return max(sum1, sum2)
    }
}

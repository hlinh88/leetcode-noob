class Solution {
    func findMedianSortedArrays(_ nums1: [Int], _ nums2: [Int]) -> Double {
        let m = nums1.count, n = nums2.count
        let med1 = getMedian(nums1, nums2, (m + n) / 2 + 1)

        if (m + n) % 2 == 1 {
            return Double(med1)
        }

        let med2 = getMedian(nums1, nums2, (m + n) / 2)
        return Double(med1 + med2) / 2
    }

    func getMedian(_ nums1: [Int], _ nums2: [Int], _ k: Int) -> Int {
        var l = -1_000_000, r = 1_000_000

        while l <= r {
            let mid = l + (r - l) / 2

            let count1 = countLessThan(nums1, mid)
            let count2 = countLessThan(nums2, mid)

            if count1 + count2 >= k {
                r = mid - 1
            } else {
                l = mid + 1
            }

            print("l: \(l), r: \(r), mid: \(mid), count1: \(count1), count2: \(count2), k: \(k)")
        }

        return l
    }

    func countLessThan(_ nums: [Int], _ target: Int) -> Int {
        var l = 0, r = nums.count - 1

        while l <= r {
            let mid = l + (r - l) / 2
            if nums[mid] <= target {
                l = mid + 1
            } else {
                r = mid - 1
            }
        }

        return l
    }

}

Solution().findMedianSortedArrays([5,7,8,11], [4,9,12,14])

// O(m+n)
//        let m = nums1.count, n = nums2.count
//        let total = m + n
//        var i = 0, j = 0
//        var prev = 0, current = 0
//
//        for _ in 0...total/2 {
//            prev = current
//            if i < m && (j >= n || nums1[i] <= nums2[j]) {
//                current = nums1[i]
//                i += 1
//            } else {
//                current = nums2[j]
//                j += 1
//            }
//        }
//
//        if total % 2 == 0 {
//            return Double(prev + current) / 2.0
//        } else {
//            return Double(current)
//        }

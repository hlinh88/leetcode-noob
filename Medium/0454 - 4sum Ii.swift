//Input: nums1 = [1,2], nums2 = [-2,-1], nums3 = [-1,2], nums4 = [0,2]
//Output: 2
//Explanation:
//The two tuples are:
//1. (0, 0, 0, 1) -> nums1[0] + nums2[0] + nums3[0] + nums4[1] = 1 + (-2) + (-1) + 2 = 0
//2. (1, 1, 0, 0) -> nums1[1] + nums2[1] + nums3[0] + nums4[0] = 2 + (-1) + (-1) + 0 = 0

class Solution {
    func fourSumCount(_ nums1: [Int], _ nums2: [Int], _ nums3: [Int], _ nums4: [Int]) -> Int {
        var res = 0
        var dict: [Int: Int] = [:]

        for num1 in nums1 {
            for num2 in nums2 {
                dict[num1 + num2, default: 0] += 1
            }
        }

        print(dict)

        for num3 in nums3 {
            for num4 in nums4 {
                if let value = dict[-(num3 + num4)] {
                    res += value
                }
            }
        }

        return res
    }
}

Solution().fourSumCount([-1,-1], [-1, 1], [-1, 1], [1, -1])

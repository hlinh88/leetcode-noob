//Input: nums1 = [4,9,5], nums2 = [9,4,9,8,4]
//Output: [4,9]
//Explanation: [9,4] is also accepted.


class Solution {
    func intersect(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
        var res: [Int] = []
        var dict: [Int: Int] = [:]

        for num in nums1 {
            dict[num, default: 0] += 1
        }

        for num in nums2 {
            if let value = dict[num] {
                res.append(num)
                dict[num]! -= 1
                if dict[num] == 0 {
                    dict[num] = nil
                }
            }
        }

        return res
    }
}
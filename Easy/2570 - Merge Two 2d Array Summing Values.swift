// Input: nums1 = [[1,2],[2,3],[4,5]], nums2 = [[1,4],[3,2],[4,1]]
// Output: [[1,6],[2,3],[3,2],[4,6]]
// Explanation: The resulting array contains the following:
// - id = 1, the value of this id is 2 + 4 = 6.
// - id = 2, the value of this id is 3.
// - id = 3, the value of this id is 2.
// - id = 4, the value of this id is 5 + 1 = 6.

class Solution {
    func mergeArrays(_ nums1: [[Int]], _ nums2: [[Int]]) -> [[Int]] {
        var res = [[Int]]()
        var dict: [Int: Int] = [:]

        for num in nums1 {
            dict[num[0], default: 0] += num[1]
        }

        for num in nums2 {
            if let value = dict[num[0]] {
                dict[num[0]] = value + num[1]
            } else {
                dict[num[0], default: 0] += num[1]
            }
        }

        for (k, v) in dict.sorted(by: {$0.key < $1.key}) {
            res.append([k, v])
        }

        return res
    }
}
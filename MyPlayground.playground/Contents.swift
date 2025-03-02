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

Solution().mergeArrays([[1,2],[2,3],[4,5]], [[1,4],[3,2],[4,1]])

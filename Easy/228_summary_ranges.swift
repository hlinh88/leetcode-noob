//Input: nums = [0,2,3,4,6,8,9]
//Output: ["0","2->4","6","8->9"]
//Explanation: The ranges are:
//[0,0] --> "0"
//[2,4] --> "2->4"
//[6,6] --> "6"
//[8,9] --> "8->9"

class Solution {
    func summaryRanges(_ nums: [Int]) -> [String] {
        if nums.count == 0 {
            return []
        }
        var res: [String] = []
        var cur: [Int] = [nums[0]]

        for i in 1..<nums.count {
            print(nums[i])

            if nums[i] - 1 != nums[i-1] {
                res.append(cur.count == 1 ? "\(cur[0])" : "\(cur[0])->\(cur[cur.count-1])")
                cur = []
            }

            cur.append(nums[i])
        }

        if !cur.isEmpty {
            res.append(cur.count == 1 ? "\(cur[0])" : "\(cur[0])->\(cur[cur.count-1])")
        }

        print(res)
        return res
    }
}

Solution().summaryRanges([0,2,3,4,6,8,9])

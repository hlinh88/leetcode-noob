//Input: nums = ["01","10"]
//Output: "11"
//Explanation: "11" does not appear in nums. "00" would also be correct.

class Solution {
    func findDifferentBinaryString(_ nums: [String]) -> String {
        let numSet = Set(nums)
        var res = ""
        var temp = ""
        let n = nums[0].count
        var found = false

        func backtracking(_ index: Int) {
            if found { return }
            if index == n {
                if !numSet.contains(temp) {
                    res = temp
                    found = true
                }
                return
            }

            for i in 0..<2 {
                temp.append(String(i))
                backtracking(index + 1)
                temp.removeLast()
            }
        }

        backtracking(0)
        return res
    }
}

Solution().findDifferentBinaryString(["111","011","001"])

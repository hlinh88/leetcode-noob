//Input: pattern = "IIIDIDDD"
//Output: "123549876"
//Explanation:
//At indices 0, 1, 2, and 4 we must have that num[i] < num[i+1].
//At indices 3, 5, 6, and 7 we must have that num[i] > num[i+1].
//Some possible values of num are "245639871", "135749862", and "123849765".
//It can be proven that "123549876" is the smallest possible num that meets the conditions.
//Note that "123414321" is not possible because the digit '1' is used more than once.

class Solution {
    func smallestNumber(_ pattern: String) -> String {
        let pattern = Array(pattern)
        var res = ""
        var nums = Array(1...9)
        var dCount = 0

        for (i, p) in pattern.enumerated() {
            if p == "D" {
                dCount += 1
            } else {
                for d in stride(from: dCount, through: 0, by: -1) {
                    res += String(nums[d])
                }
                nums.removeFirst(dCount + 1)
                dCount = 0
            }
        }

        for d in stride(from: dCount, through: 0, by: -1) {
            res += String(nums[d])
        }

        return res
    }

}

Solution().smallestNumber("IIIDIDDD")

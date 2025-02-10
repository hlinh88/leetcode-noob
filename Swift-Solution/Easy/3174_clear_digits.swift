//Example 1:
//Input: s = "abc"
//Output: "abc"
//Explanation:
//There is no digit in the string.
//
//Example 2:
//Input: s = "cb34"
//Output: ""
//Explanation:
//First, we apply the operation on s[2], and s becomes "c4".
//Then we apply the operation on s[1], and s becomes "".

class Solution {
    func clearDigits(_ s: String) -> String {
        var s = s
        var res = ""

        for char in s {
            if char.isNumber {
                res.removeLast()
            } else {
                res += String(char)
            }
        }

        print(res)

        return res
    }
}

Solution().clearDigits("pl5v0jttxe9acvd0t9vtxwrhvwajpasfe2nhtws48pweam4vsomd79nw14ed")
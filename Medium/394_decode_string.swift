//Input: s = "2[abc]3[cd]ef"
//Output: "abcabccdcdcdef"

// Stack

class Solution {
    func decodeString(_ s: String) -> String {
        var res = ""
        var num = 0
        var str = ""
        var numStack = [Int]()
        var strStack = [String]()

        for char in s {
            switch char {
            case "[":
                numStack.append(num)
                strStack.append(str)
                num = 0
                str = ""

            case "]":
                let repeatCount = numStack.removeLast()
                let repeatedStr = String(repeating: str, count: repeatCount)
                str = strStack.removeLast() + repeatedStr

            default:
                if let digit = char.wholeNumberValue {
                    num = num * 10 + digit
                } else {
                    str.append(char)
                }
            }
        }

        return res + str
    }
}

Solution().decodeString("abc3[cd]xyz")

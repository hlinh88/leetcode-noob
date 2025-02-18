//Input: s = "(1+(4+5+2)-3)+(6+8)"
//Output: 23

class Solution {
    func calculate(_ s: String) -> Int {
        var result = 0
        var num = 0
        var sign = 1
        var stack = [sign]

        for char in s where char != " " {
            switch char {
            case "+", "-":
                result += num * sign
                sign = stack.last! * (char == "+" ? 1 : -1)
                num = 0
            case "(":
                stack.append(sign)
            case ")":
                stack.removeLast()
            case " ":
                break
            default:
                num = num * 10 + char.wholeNumberValue!
            }

            print("result: \(result), num: \(num), sign: \(sign), stack: \(stack)")
        }

        return result + num * sign
    }
}

Solution().calculate("- (3 + (-4 - 5))")


//Example 1:
//
//Input: s = "3+2*2"
//Output: 7
//Example 2:
//
//Input: s = " 3/2 "
//Output: 1
//Example 3:
//
//Input: s = " 3+5 / 2 "
//Output: 5

class Solution {
    func calculate(_ s: String) -> Int {
        var num = 0
        var stack = [Int]()
        var op = "+"

        for char in s+"+" where char != " " {
            if let number = char.wholeNumberValue {
                num = num * 10 + number
            } else {
                // handle + - * /
                switch op {
                    case "+":
                    stack.append(num)
                    case "-":
                    stack.append(-num)
                    case "*":
                    stack.append(stack.removeLast() * num)
                    case "/":
                    stack.append(stack.removeLast() / num)
                   default: break
                }
                num = 0
                op = String(char)
            }
        }
        return stack.reduce(0, +)
    }
}

Solution().calculate("3+10*2/4-1");
//Solution().calculate("1*2+3*4");
//Solution().calculate("12-3*4");

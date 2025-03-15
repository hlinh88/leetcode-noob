// Input: s = ")()())"
// Output: 4
// Explanation: The longest valid parentheses substring is "()()".

// Stack of index to find the longest [new - last]

class Solution {
    func longestValidParentheses(_ s: String) -> Int {
        var stack = [-1]
        var res = 0

        for (index, char) in s.enumerated() {
            if char == "(" {
                stack.append(index)
            } else {
                stack.removeLast()

                if let last = stack.last {
                    res = max(res, index - last)
                } else {
                    stack.append(index)
                }
            }

            print(stack)
        }
        return res
    }
}

Solution().longestValidParentheses(")()())")

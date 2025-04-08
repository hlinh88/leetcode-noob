// Backtracking

class Solution {
    func generateParenthesis(_ n: Int) -> [String] {
        var stack: [String] = []
        var result: [String] = []
        func backtracking(_ open: Int, _ close: Int) {
            if open == n && close == n {
                result.append(stack.joined())
                return
            }
            
            if open < n {
                stack.append("(")
                backtracking(open + 1, close)
                stack.removeLast()
            }
            
            if close < open {
                stack.append(")")
                backtracking(open, close + 1)
                stack.removeLast()
            }
        }
        
        backtracking(0, 0)
        return result
    }
}

Solution().generateParenthesis(3)

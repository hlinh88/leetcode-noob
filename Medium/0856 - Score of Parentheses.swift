// The score of a balanced parentheses string is based on the following rule:

// "()" has score 1.
// AB has score A + B, where A and B are balanced parentheses strings.
// (A) has score 2 * A, where A is a balanced parentheses string.

class Solution {
    func scoreOfParentheses(_ s: String) -> Int {
         var s = Array(s), val = 0, score = 0
        
        for i in 0 ..< s.count {
            if s[i] == "(" {
                val += 1
            } else {
                val -= 1
                if s[i-1] == "(" { score += 1 << val }
            }
        }
        return score
    }
}
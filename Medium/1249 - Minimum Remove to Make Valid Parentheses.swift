// Input: s = "lee(t(c)o)de)"
// Output: "lee(t(c)o)de"
// Explanation: "lee(t(co)de)" , "lee(t(c)ode)" would also be accepted.

// Go L -> R and R -> L

class Solution {
    func minRemoveToMakeValid(_ s: String) -> String {
        var s = Array(s)
        var l = 0, r = 0
        
        for i in 0..<s.count {
            if s[i] == "(" {
                l += 1
            } else if s[i] == ")" {
                r += 1
            }
            
            if r > l {
                s[i] = " "
                r -= 1
            }
        }
        
        l = 0
        r = 0
        
        for i in stride(from: s.count - 1, through: 0, by: -1) {
            if s[i] == ")" {
                l += 1
            } else if s[i] == "(" {
                l -= 1
            }
            
            if l < 0 {
                s[i] = " "
                l += 1
            }
        }
        
        return String(s.filter { $0 != " " })
    }
}
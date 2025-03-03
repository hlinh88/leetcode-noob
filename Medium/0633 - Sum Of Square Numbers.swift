//Given a non-negative integer c, decide whether there're two integers a and b such that a2 + b2 = c.
//
//

// Two pointer < c^2

class Solution {
    func judgeSquareSum(_ c: Int) -> Bool {
        var l = 0, r = Int(sqrt(Double(c)))

        while l <= r {
            var val = l * l + r * r
            if val < c {
                l += 1
            } else if val > c {
                r -= 1
            } else {
                return true
            }
        }

        return false
    }
}

Solution().judgeSquareSum(61)
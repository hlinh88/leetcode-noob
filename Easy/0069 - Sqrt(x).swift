// Binary Search

class Solution {
    func mySqrt(_ x: Int) -> Int {
        var l = 0, r = x
        
        while l <= r {
            let m = (l + r) / 2
            let sqr = m * m
            
            if sqr == x {
                return m
            }
            
            if sqr < x {
                l = m + 1
            } else {
                r = m - 1
            }
        }
        
        return r
    }
}
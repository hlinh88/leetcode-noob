// Exponential math 

class Solution {
    func myPow(_ x: Double, _ n: Int) -> Double {
        var x = x, n = n 
        if n < 0 {
            n = -n
            x = 1 / x
        }
        var res: Double = 1

        while n != 0 {
            if n % 2 != 0 {
                res *= x
            }
            n /= 2
            x = x * x
        }

        return res 
    }
}
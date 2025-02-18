//Input: x = -123
//Output: -321

class Solution {
    func reverse(_ x: Int) -> Int {
        var res = 0, x = x

        while x != 0 {
            res = res * 10 + x % 10
            x /= 10


        }

        return res > Int32.max || res < Int32.min ? 0 : res
    }
}

Solution().reverse(-123)

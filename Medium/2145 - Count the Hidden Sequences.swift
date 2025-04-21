// Math

class Solution {
    func numberOfArrays(_ differences: [Int], _ lower: Int, _ upper: Int) -> Int {
        var i = 0, j = 0, cur = 0
        
        for diff in differences {
            cur += diff
            i = min(i, cur)
            j = max(j, cur)
            if j - i > upper - lower {
                return 0
            }
        }
        
        return (upper - lower) - (j - i) + 1
    }
}

Solution().numberOfArrays([1,-3,4], 1, 6)

class Solution {
    func countGoodRectangles(_ rectangles: [[Int]]) -> Int {
        var count = 0
        var len = 0
        for r in rectangles {
            var cur = min(r[0], r[1])
            if cur > len {
                len = cur
                count = 1
            } else if cur == len {
                count += 1
            }
        }
        
        return count
    }
}

Solution().countGoodRectangles([[5,8],[3,9],[5,12],[16,5]])

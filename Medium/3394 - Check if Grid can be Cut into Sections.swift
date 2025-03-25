class Solution {
    func checkValidCuts(_ n: Int, _ rectangles: [[Int]]) -> Bool {
        var xs: [(Int, Int)] = []
        var ys: [(Int, Int)] = []
        for r in rectangles {
            xs.append((r[0], r[2]))
            ys.append((r[1], r[3]))
        }
        
        xs.sort { $0.0 == $1.0 ? $0.1 < $1.1 : $0.0 < $1.0 }
        ys.sort { $0.0 == $1.0 ? $0.1 < $1.1 : $0.0 < $1.0 }
        
        return max(countNonOverlaps(xs), countNonOverlaps(ys)) >= 3
    }
    
    func countNonOverlaps(_ intervals: [(Int, Int)]) -> Int {
        var count = 0
        var prevEnd = -1
        for (start, end) in intervals {
            if prevEnd <= start {
                count += 1
            }
            prevEnd = max(prevEnd, end)
        }
        
        return count
    }
}
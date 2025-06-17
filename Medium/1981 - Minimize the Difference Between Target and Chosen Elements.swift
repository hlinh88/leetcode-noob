class Solution {
    func minimizeTheDifference(_ mat: [[Int]], _ target: Int) -> Int {
        var rows = mat.count
        var prev: Set<Int> = []
        var cur: Set<Int> = []
        
        cur.insert(0)
        
        for i in 0..<rows {
            prev = cur
            cur = []
            for sum in prev {
                for num in mat[i] {
                    cur.insert(sum + num)
                }
            }
        }
        
        var result = Int.max
        for num in cur {
            result = min(result, abs(num - target))
        }
        
        return result
    }
}
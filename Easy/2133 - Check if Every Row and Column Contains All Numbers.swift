// Input: matrix = [[1,2,3],[3,1,2],[2,3,1]]
// Output: true
// Explanation: In this case, n = 3, and every row and column contains the numbers 1, 2, and 3.
// Hence, we return true.

class Solution {
    func checkValid(_ matrix: [[Int]]) -> Bool {
        var n = matrix.count
        
        for r in 0..<n {
            var set: Set<Int> = []
            for c in 0..<n {
                set.insert(matrix[r][c])
            }
            
            if set.count != n {
                return false
            }
        }
        
        for r in 0..<n {
            var set: Set<Int> = []
            for c in 0..<n {
                set.insert(matrix[c][r])
            }
            
            if set.count != n {
                return false
            }
        }
        
        return true
    }
}
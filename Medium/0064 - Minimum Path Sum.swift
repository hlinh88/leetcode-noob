// Matrix + DP

class Solution {
    func minPathSum(_ grid: [[Int]]) -> Int {
        var matrix = grid
        var r = grid.count, c = grid[0].count
        
        for i in 0..<r {
            for j in 0..<c {
                if i == 0 && j == 0 {
                    continue
                }
                
                if i == 0 {
                    matrix[i][j] += matrix[i][j-1]
                    continue
                }
                
                if j == 0 {
                    matrix[i][j] += matrix[i-1][j]
                    continue
                }
                
                matrix[i][j] += min(matrix[i-1][j], matrix[i][j-1])
            }
        }
        
        return matrix[r-1][c-1]
    }
}

Solution().minPathSum([[1,3,1],[1,5,1],[4,2,1]])

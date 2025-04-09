// Matrix + Dynamic Programming

class Solution {
    func uniquePaths(_ m: Int, _ n: Int) -> Int {
        var matrix = Array(repeating: Array(repeating: 0, count: n), count: m)
        for i in 0..<m {
            for j in 0..<n {
                if i == 0 || j == 0 {
                    matrix[i][j] = 1
                    continue
                }
                matrix[i][j] = matrix[i - 1][j] + matrix[i][j - 1]
            }
        }
        
        print(matrix)
        return matrix[m-1][n-1]
    }
}

Solution().uniquePaths(3, 7)

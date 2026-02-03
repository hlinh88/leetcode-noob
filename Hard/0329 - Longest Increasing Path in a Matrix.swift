class Solution {
    func longestIncreasingPath(_ matrix: [[Int]]) -> Int {
        let rows = matrix.count
        let cols = matrix[0].count
        
        var res = 0
        var dirs = [(0,1), (0,-1), (1,0), (-1,0)]
        var dp = Array(repeating: Array(repeating: 0, count: cols), count: rows)
        
        func dfs(_ r: Int, _ c: Int) -> Int {
            if dp[r][c] != 0 { return dp[r][c] }
            
            var best = 1
            
            for (dr, dc) in dirs {
                let nr = r + dr
                let nc = c + dc
                
                if nr < 0 || nr >= rows || nc < 0 || nc >= cols { continue }
                if matrix[nr][nc] <= matrix[r][c] { continue }
                
                best = max(best, dfs(nr, nc) + 1)
            }
            
            dp[r][c] = best
            return best
        }
        
        for r in 0..<rows {
            for c in 0..<cols {
                res = max(res, dfs(r, c))
            }
        }
        
        return res
    }
}

Solution().longestIncreasingPath([[9,9,4],[6,6,8],[2,1,1]])

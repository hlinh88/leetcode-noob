// Input: grid = [[1,1,1,1,1,1,1,0],[1,0,0,0,0,1,1,0],[1,0,1,0,1,1,1,0],[1,0,0,0,0,1,0,1],[1,1,1,1,1,1,1,0]]
// Output: 2
// Explanation: 
// Islands in gray are closed because they are completely surrounded by water (group of 1s).

// Similar Number of Islands but edge case

class Solution {
    func closedIsland(_ grid: [[Int]]) -> Int {
        var grid = grid
        var rows = grid.count
        var cols = grid[0].count
        
        func dfs(_ r: Int, _ c: Int) -> Bool {
            if r < 0 || r >= rows || c < 0 || c >= cols {
                return false
            }
            
            if grid[r][c] == 1 {
                return false
            }
            
            grid[r][c] = 1
            let isEdge = r == 0 || r == rows - 1 || c == 0 || c == cols - 1
            let down = dfs(r + 1, c)
            let up = dfs(r - 1, c)
            let left = dfs(r, c - 1)
            let right = dfs(r, c + 1)
            
            return isEdge || down || up || left || right
        }
        
        var count = 0
        for i in 0..<rows {
            for j in 0..<cols {
                if grid[i][j] == 0 {
                    if !dfs(i, j) {
                        count += 1
                    }
                }
            }
        }
    
        return count
    }
}

Solution().closedIsland([[0,0,1,1,0,1,0,0,1,0],[1,1,0,1,1,0,1,1,1,0],[1,0,1,1,1,0,0,1,1,0],[0,1,1,0,0,0,0,1,0,1],[0,0,0,0,0,0,1,1,1,0],[0,1,0,1,0,1,0,1,1,1],[1,0,1,0,1,1,0,0,0,1],[1,1,1,1,1,1,0,0,0,0],[1,1,1,0,0,1,0,1,0,1],[1,1,1,0,1,1,0,1,1,0]])

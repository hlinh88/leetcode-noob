// DFS
// Array bool row - col
// dfs(i - 1, j)
// dfs(i + 1, j)
// dfs(i, j - 1)
// dfs(i, j + 1)
// Insert to visited node 
// Loop through grid to count number of islands

class Solution {
    func numIslands(_ grid: [[Character]]) -> Int {
        guard !grid.isEmpty else {
            return 0
        }
        
        var res = 0
        var rows = grid.count
        var cols = grid[0].count
        var visited = Array(repeating: Array(repeating: false, count: cols),
                            count: rows)
        
        func dfs(_ i: Int, _ j: Int) {
            print("i: \(i), j: \(j)")
            if i >= rows ||
                j >= cols ||
                i < 0 ||
                j < 0 ||
                grid[i][j] == "0" ||
                visited[i][j] {
                return
            }
            
            visited[i][j] = true
            
            dfs(i - 1, j)
            dfs(i + 1, j)
            dfs(i, j - 1)
            dfs(i, j + 1)
        }
        
        for i in 0..<rows {
            for j in 0..<cols {
                if !visited[i][j], grid[i][j] == "1" {
                    dfs(i, j)
                    res += 1
                }
            }
        }
        
        return res
    }
}

Solution().numIslands([
    ["1","1","0","0","0"],
    ["1","1","0","0","0"],
    ["0","0","1","0","0"],
    ["0","0","0","1","1"]
  ])



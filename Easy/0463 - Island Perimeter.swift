// DFS 
// -> Search for land 
// -> Check every path of land dfs(i - 1, j) + dfs(i + 1, j) + dfs(i, j - 1) + dfs(i, j + 1)
// -> Add sum == perimeter


class Solution {
    func islandPerimeter(_ grid: [[Int]]) -> Int {
        var rows = grid.count
        var cols = grid[0].count
        var visited: Set<[Int]> = []
        
        func dfs(_ i: Int, _ j: Int) -> Int {
            print("i: \(i), j: \(j)")
            if i >= rows ||
                j >= cols ||
                i < 0 ||
                j < 0 ||
                grid[i][j] == 0 {
                return 1
            }
            
            if visited.contains([i, j]) {
                return 0
            }
            
            visited.insert([i, j])
            return dfs(i - 1, j) + dfs(i + 1, j) + dfs(i, j - 1) + dfs(i, j + 1)
        }
        
        for i in 0..<rows {
            for j in 0..<cols {
                if grid[i][j] == 1 {
                    return dfs(i, j)
                }
            }
        }
        
        return -1
    }
}

Solution().islandPerimeter([[0,1,0,0],[1,1,1,0],[0,1,0,0],[1,1,0,0]])

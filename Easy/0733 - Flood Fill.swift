// Input: image = [[1,1,1],[1,1,0],[1,0,1]], sr = 1, sc = 1, color = 2

// Output: [[2,2,2],[2,2,0],[2,0,1]]

// Microsoft Paint -> DFS

class Solution {
    func floodFill(_ image: [[Int]], _ sr: Int, _ sc: Int, _ color: Int) -> [[Int]] {
        var res = image
        var rows = res.count, columns = res[0].count
        var val = res[sr][sc]

        if val == color {
            return res
        }
        
        func dfs(_ r: Int, _ c: Int) {
            if r < 0 || r >= rows || c < 0 || c >= columns || res[r][c] != val {
                return
            }
            res[r][c] = color
            dfs(r - 1, c)
            dfs(r + 1, c)
            dfs(r, c - 1)
            dfs(r, c + 1)
        }
        
        dfs(sr, sc)
        
        return res
    }
}
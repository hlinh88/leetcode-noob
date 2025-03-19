//Input: board = [["A","B","C","E"],["S","F","C","S"],["A","D","E","E"]], word = "ABCCED"
// Output: true

// Super backtracking

class Solution {
    func exist(_ board: [[Character]], _ word: String) -> Bool {
        var row = board.count, col = board[0].count
        var word = Array(word)
        var path: Set<String> = []
        
        func dfs(_ r: Int, _ c: Int, _ i: Int) -> Bool {
            if i == word.count {
                return true
            }
            
            if r < 0 || c < 0 || r >= row || c >= col || word[i] != board[r][c] || path.contains("\(r),\(c)") {
                return false
            }
            
            path.insert("\(r),\(c)")
            var found = dfs(r - 1, c, i + 1) ||
                        dfs(r + 1, c, i + 1) ||
                        dfs(r, c - 1, i + 1) ||
                        dfs(r, c + 1, i + 1)
            
            path.remove("\(r),\(c)")
            
            return found
        }
        
        for r in 0..<row {
            for c in 0..<col {
                if dfs(r, c, 0) {
                    return true
                }
            }
        }
        
        return false
    }
}

Solution().exist([["A","B","C","E"],["S","F","C","S"],["A","D","E","E"]], "ABCCED")

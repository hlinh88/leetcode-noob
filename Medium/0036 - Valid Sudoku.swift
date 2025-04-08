class Solution {
    func isValidSudoku(_ board: [[Character]]) -> Bool {
        var visited: Set<String> = []
        
        for r in 0..<9 {
            for c in 0..<9 {
                let value = String(board[r][c])
                if value == "." { continue }
                
                let row = "\(value) in row \(r)"
                let col = "\(value) in col \(c)"
                let box = "\(value) in box (\(r / 3),\(c / 3))"
                
                if visited.contains(row) || visited.contains(col) || visited.contains(box) {
                    return false
                }
                
                visited.insert(row)
                visited.insert(col)
                visited.insert(box)
            }
        }
        
        return true
    }
}

Solution().isValidSudoku([["5","3",".",".","7",".",".",".","."],
                          ["6",".",".","1","9","5",".",".","."],
                          [".","9","8",".",".",".",".","6","."],
                          ["8",".",".",".","6",".",".",".","3"],
                          ["4",".",".","8",".","3",".",".","1"],
                          ["7",".",".",".","2",".",".",".","6"],
                          [".","6",".",".",".",".","2","8","."],
                          [".",".",".","4","1","9",".",".","5"],
                          [".",".",".",".","8",".",".","7","9"]])

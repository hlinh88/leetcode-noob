// Backtracking

class Solution {
    func solveSudoku(_ board: inout [[Character]]) {
        backtracking(&board)
        print(board)
    }
    
    func backtracking(_ board: inout [[Character]]) -> Bool {
        for r in 0..<9 {
            for c in 0..<9 {
                if board[r][c] == "." {
                    for num in "123456789" {
                        if isValid(board, r, c, num) {
                            board[r][c] = num
                            if backtracking(&board) {
                                return true
                            }
                            board[r][c] = "."
                        }
                    }
                    
                    return false
                }
            }
        }
        
        return true
    }
    
    func isValid(_ board: [[Character]], _ row: Int, _ col: Int, _ num: Character) -> Bool {
        for i in 0..<9 {
            if board[row][i] == num ||
                board[i][col] == num ||
                board[3 * (row / 3) + i / 3][3 * (col / 3) + i % 3] == num {
                return false
            }
        }
        return true
    }
}


var board: [[Character]] = [["5","3",".",".","7",".",".",".","."],
                            ["6",".",".","1","9","5",".",".","."],
                            [".","9","8",".",".",".",".","6","."],
                            ["8",".",".",".","6",".",".",".","3"],
                            ["4",".",".","8",".","3",".",".","1"],
                            ["7",".",".",".","2",".",".",".","6"],
                            [".","6",".",".",".",".","2","8","."],
                            [".",".",".","4","1","9",".",".","5"],
                            [".",".",".",".","8",".",".","7","9"]]
Solution().solveSudoku(&board)

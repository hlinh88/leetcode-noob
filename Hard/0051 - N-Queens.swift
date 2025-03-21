// Best backtraking

class Solution {
    func solveNQueens(_ n: Int) -> [[String]] {
        var columns: Set<Int> = []
        var posDiag: Set<Int> = []
        var negDiag: Set<Int> = []
        
        var result: [[String]] = []
        var board = Array(repeating: Array(repeating: ".", count: n), count: n)
        
        func backtrack(_ row: Int) {
            if row == n {
                var res: [String] = []
                for b in board {
                    res.append(b.joined())
                }
                result.append(res)
                print("Solution found:")
                printBoard(board)
                return
            }
            
            for col in 0..<n {
                let pos = row + col
                let neg = row - col
                if columns.contains(col) || posDiag.contains(pos) || negDiag.contains(neg) {
                    continue
                }
                
                // Place the queen
                columns.insert(col)
                posDiag.insert(pos)
                negDiag.insert(neg)
                board[row][col] = "Q"
                
                print("columns: \(columns), posDia: \(posDiag), negDia: \(negDiag)")
                print("Placing Q at (\(row), \(col))")
                printBoard(board)
                
                // Move to the next row
                backtrack(row + 1)
                
                // Remove the queen (backtrack)
                board[row][col] = "."
                columns.remove(col)
                posDiag.remove(pos)
                negDiag.remove(neg)
                
                print("Removing Q from (\(row), \(col))")
                printBoard(board)
            }
        }
        
        backtrack(0)
        
        return result
    }
    
    func printBoard(_ board: [[String]]) {
        for row in board {
            print(row.joined(separator: " "))
        }
        print()
    }
}

Solution().solveNQueens(4)

class Solution {
    func solve(_ board: inout [[Character]]) {
        for r in 0..<board.count {
            for c in 0..<board[r].count {
                var currentBoard = board
                if dfs(&currentBoard, r, c) {
                    board = currentBoard
                }
            }
        }
    }

    func dfs(_ board: inout [[Character]], _ r: Int, _ c: Int) -> Bool {
        if r < 0 || r >= board.count || c < 0 || c >= board[r].count { return false }

        if board[r][c] != "O" { return true }

        board[r][c] = "X"

        for (x, y) in [(r-1, c), (r+1, c), (r, c-1), (r, c+1)] {
            if !dfs(&board, x, y) { return false }
        }

        return true
    }
}
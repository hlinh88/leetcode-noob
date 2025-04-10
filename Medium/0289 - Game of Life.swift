class Solution {
    func gameOfLife(_ board: inout [[Int]]) {
        var m = board.count
        var n = board[0].count
        var matrix = board
        
        let directions = [
            (-1, -1), (-1, 0), (-1, 1),
            (0, -1),           (0, 1),
            (1, -1),  (1, 0),  (1, 1)
        ]
        
        func liveNeighborsCount(_ row: Int, _ col: Int) -> Int {
            var count = 0
            for (dx, dy) in directions {
                let newRow = row + dx
                let newCol = col + dy
                
                if newRow >= 0, newRow < m, newCol >= 0, newCol < n, board[newRow][newCol] == 1 {
                    count += 1
                }
            }
            
            return count
        }
        
        for r in 0..<m {
            for c in 0..<n {
                let liveNeighbors = liveNeighborsCount(r, c)
                
                if matrix[r][c] == 1 {
                    matrix[r][c] = liveNeighbors == 2 || liveNeighbors == 3 ? 1 : 0
                } else {
                    matrix[r][c] = liveNeighbors == 3 ? 1 : 0
                }
            }
        }
        
        board = matrix
    }
}

var board: [[Int]] = [[0,1,0],[0,0,1],[1,1,1],[0,0,0]]
Solution().gameOfLife(&board)

class Solution {
    func totalNQueens(_ n: Int) -> Int {
        var columns: Set<Int> = []
        var posDiag: Set<Int> = []
        var negDiag: Set<Int> = []
        
        var result: Int = 0
        
        func backtrack(_ row: Int) {
            guard row < n else {
                result += 1
                return
            }
            
            for col in 0..<n {
                let pos = row + col
                let neg = row - col
                if columns.contains(col)
                    || posDiag.contains(pos)
                    || negDiag.contains(neg) {
                    continue
                }
                
                columns.insert(col)
                posDiag.insert(pos)
                negDiag.insert(neg)
                
                backtrack(row + 1)
                
                columns.remove(col)
                posDiag.remove(pos)
                negDiag.remove(neg)
            }
        }
        
        backtrack(0)
        
        return result
    }
}

Solution().totalNQueens(4)

//Input: matrix = [[0,1,2,0],[3,4,5,2],[1,3,1,5]]
//Output: [[0,0,0,0],[0,4,5,0],[0,3,1,0]]

class Solution {
    func setZeroes(_ matrix: inout [[Int]]) {
        var rows: Set<Int> = []
        var cols: Set<Int> = []

        for r in 0..<matrix.count {
            for c in 0..<matrix[r].count {
                if matrix[r][c] == 0 {
                    rows.insert(r)
                    cols.insert(c)
                }
            }
        }

        for r in 0..<matrix.count {
            for c in 0..<matrix[r].count {
                if rows.contains(r) || cols.contains(c) {
                    matrix[r][c] = 0
                }
            }
        }

        print(matrix)
    }
}

var matrix = [[0,1,2,0],[3,4,5,2],[1,3,1,5]]
Solution().setZeroes(&matrix)

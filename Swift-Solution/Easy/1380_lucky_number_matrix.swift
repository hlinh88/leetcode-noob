//Input: matrix = [[1,10,4,2],[9,3,8,7],[15,16,17,12]]
//Output: [12]
//Explanation: 12 is the only lucky number since it is the minimum in its row and the maximum in its column.

class Solution {
    func luckyNumbers(_ matrix: [[Int]]) -> [Int] {
        if matrix.count == 0 { return [] }

        var r = matrix.count, c = matrix[0].count
        var minRow = [Int](), maxCol = [Int]()

        for i in 0..<r {
            var currentMin = matrix[i][0]

            for j in 0..<c {
                currentMin = min(currentMin, matrix[i][j])
            }

            minRow.append(currentMin)
        }

        for i in 0..<c {
            var currentMax = matrix[0][i]

            for j in 0..<r {
                currentMax = max(currentMax, matrix[j][i])
            }

            maxCol.append(currentMax)
        }

        print(minRow)
        print(maxCol)
        print(minRow.filter { maxCol.contains($0) })

        return minRow.filter { maxCol.contains($0) }
    }
}

Solution().luckyNumbers([[1,10,4,2],[9,3,8,7],[15,16,17,12]])

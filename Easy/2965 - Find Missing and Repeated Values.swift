// Input: grid = [[9,1,7],[8,9,2],[3,4,6]]
// Output: [9,5]
// Explanation: Number 9 is repeated and number 5 is missing so the answer is [9,5].

class Solution {
    func findMissingAndRepeatedValues(_ grid: [[Int]]) -> [Int] {
        let n = grid.count
        let size = n * n
        var freq = Array(repeating: 0, count: size + 1)
        var actualSum = 0
        var duplicate = -1
        
        for row in grid {
            for num in row {
                actualSum += num
                if freq[num] == 1 {
                    duplicate = num
                }
                freq[num] += 1
            }
        }
        
        let expectedSum = size * (size + 1) / 2
        let missing = expectedSum - (actualSum - duplicate)
        
        return [duplicate, missing]
    }
}

Solution().findMissingAndRepeatedValues([[9,1,7],[8,9,2],[3,4,6]])

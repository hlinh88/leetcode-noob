// Input: grid = [[2,4],[6,8]], x = 2
// Output: 4
// Explanation: We can make every element equal to 4 by doing the following: 
// - Add x to 2 once.
// - Subtract x from 6 once.
// - Subtract x from 8 twice.
// A total of 4 operations were used.

// Median

class Solution {
    func minOperations(_ grid: [[Int]], _ x: Int) -> Int {
        var res = 0
        let base = grid[0][0]
        var arr: [Int] = []
        
        for i in 0..<grid.count {
            for j in 0..<grid[i].count {
                if (grid[i][j] - base) % x != 0 {
                    return -1
                }
                arr.append(grid[i][j])
            }
        }
        
        arr.sort()
        let median = arr[arr.count / 2]
        
        for num in arr {
            res += abs(num - median) / x
        }
        
        return res
    }
}

Solution().minOperations([[980,476,644,56],[644,140,812,308],[812,812,896,560],[728,476,56,812]], 84)

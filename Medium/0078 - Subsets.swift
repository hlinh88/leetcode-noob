// Input: nums = [1,2,3]
// Output: [[],[1],[2],[1,2],[3],[1,3],[2,3],[1,2,3]]

// Backtracking

class Solution {
    func subsets(_ nums: [Int]) -> [[Int]] {
        var res: [[Int]] = []
        var cur: [Int] = []
        
        func backtracking(_ index: Int) {
            res.append(cur)
            
            for i in index..<nums.count {
                cur.append(nums[i])
                backtracking(i + 1)
                cur.removeLast()
            }
        }
        
        backtracking(0)
        
        return res
    }
}
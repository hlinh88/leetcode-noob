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

Solution().subsets([1, 2, 3])


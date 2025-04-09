// Backtracking

class Solution {
    func subsetsWithDup(_ nums: [Int]) -> [[Int]] {
        var nums = nums.sorted()
        var res: [[Int]] = []
        var cur: [Int] = []
        
        func dfs(_ index: Int) {
            if !res.contains(cur) {
                res.append(cur)
            }
            
            for i in index..<nums.count {
                cur.append(nums[i])
                dfs(i + 1)
                cur.removeLast()
            }
        }
        
        dfs(0)
        print(res)
        
        return res
    }
}

Solution().subsetsWithDup([4,4,4,1,4])

// Backtracking 

class Solution {
    func combinationSum3(_ k: Int, _ n: Int) -> [[Int]] {
        var res: [[Int]] = []
        
        func backtracking(_ index: Int, _ arr: [Int], _ sum: Int) {
            if arr.count == k {
                if sum == n {
                    res.append(arr)
                }
                return
            }
            
            for i in index..<10 {
                backtracking(i + 1, arr + [i], sum + i)
            }
        }
        
        backtracking(1, [], 0)
        
        return res
    }
}
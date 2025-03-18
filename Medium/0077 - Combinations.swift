// Input: n = 4, k = 2
// Output: [[1,2],[1,3],[1,4],[2,3],[2,4],[3,4]]
// Explanation: There are 4 choose 2 = 6 total combinations.
// Note that combinations are unordered, i.e., [1,2] and [2,1] are considered to be the same combination.

// Backtracking

class Solution {
    func combine(_ n: Int, _ k: Int) -> [[Int]] {
        var res: [[Int]] = []
        var list: [Int] = []
        
        func backtracking(_ index: Int) {
            if list.count == k {
                res.append(list)
                return
            }
            
            if index > n { return }
            
            for i in index...n {
                if list.contains(i) { continue }
                
                list.append(i)
                backtracking(i + 1)
                list.removeLast()
            }
        }
        
        backtracking(1)
        
        return res
    }
}
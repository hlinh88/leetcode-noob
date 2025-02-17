import Foundation

class Solution {
    func permute(_ nums: [Int]) -> [[Int]] {
        var res: [[Int]] = []
        var sol: [Int] = []
        func backtrack() {
            if sol.count == nums.count {
                res.append(sol)
                return
            }
            
            for num in nums {
                if !sol.contains(num) {
                    sol.append(num)
                    backtrack()
                    sol.removeLast()
                }
            }
        }
        
        backtrack()
        
        return res
    }
}


Solution().permute([1,2,3])


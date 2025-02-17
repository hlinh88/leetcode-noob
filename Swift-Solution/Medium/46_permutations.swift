//Input: nums = [1,2,3]
//Output: [[1,2,3],[1,3,2],[2,1,3],[2,3,1],[3,1,2],[3,2,1]]
//

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

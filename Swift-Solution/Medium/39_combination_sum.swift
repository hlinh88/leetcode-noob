//Input: candidates = [2,3,6,7], target = 7
//Output: [[2,2,3],[7]]
//Explanation:
//2 and 3 are candidates, and 2 + 2 + 3 = 7. Note that 2 can be used multiple times.
//7 is a candidate, and 7 = 7.
//These are the only two combinations.

class Solution {
    func combinationSum(_ candidates: [Int], _ target: Int) -> [[Int]] {
        var res: [[Int]] = []
        var sol: [Int] = []
        let n = candidates.count

        func dfs(_ index: Int, _ sum: Int) {
            if sum == target {
                res.append(sol)
                return
            }

            if sum > target || index == n {
                return
            }

            sol.append(candidates[index])
            dfs(index, sum + candidates[index])
            sol.removeLast()

            dfs(index+1, sum)
        }

        dfs(0, 0)

        return res
    }
}
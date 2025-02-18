//Input: candidates = [10,1,2,7,6,1,5], target = 8
//Output:
//[
//[1,1,6],
//[1,2,5],
//[1,7],
//[2,6]
//]

class Solution {
    func combinationSum2(_ candidates: [Int], _ target: Int) -> [[Int]] {
        var path: [Int] = [], result: [[Int]] = []
        dfs(&result, &path, candidates.sorted(), target)
        print(result)
        return result
    }

    private func dfs(_ res: inout [[Int]], _ path: inout [Int], _ cands: [Int], _ t: Int, _ idx: Int = 0) {
        guard t > 0 else { res.append(path); return }
        for k in idx..<cands.count where cands[k] <= t {
            if k > 0 && cands[k] == cands[k-1] && k != idx { continue }
            path.append(cands[k])
            print("DEBUG: RES: \(res) \n PATH: \(path) \n CANDS: \(cands) \n T: \(t) \n IDX: \(k)\n")
            dfs(&res, &path, cands, t - cands[k], k + 1)
            path.removeLast()
        }
    }
}

Solution().combinationSum2([10,1,2,7,6,1,5], 8)
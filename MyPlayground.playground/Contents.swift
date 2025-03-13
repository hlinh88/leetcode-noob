class Solution {
    func minZeroArray(_ nums: [Int], _ queries: [[Int]]) -> Int {
        let n = nums.count
        var diff = [Int](repeating: 0, count: n+1)
        var curr = 0
        var k = 0
        for i in 0..<n {
            while curr + diff[i] < nums[i] {
                if k == queries.count { return -1 }
                let (l, r, v) = (queries[k][0], queries[k][1], queries[k][2])
                k += 1
                if r < i { continue }
                diff[max(i,l)] += v
                diff[r+1] -= v
            }
            curr += diff[i]
        }
        return k
    }
}

Solution().minZeroArray([2,0,2], [[0,2,1],[0,2,1],[1,1,3]])

class Solution {
    func numberOfAlternatingGroups(_ colors: [Int], _ k: Int) -> Int {
        var res = 0
        var colors = colors + colors[0..<k-1]
        var l = 0
        print(colors)

        for r in 1..<colors.count {
            if colors[r] == colors[r-1] {
                l = r
                continue
            }

            if r - l + 1 == k {
                res += 1
                l += 1
            }
        }

        return res
    }
}

Solution().numberOfAlternatingGroups([0,1,0,1,0], 3)

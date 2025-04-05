class Solution {
    func subsetXORSum(_ nums: [Int]) -> Int {
        var res = 0 

        func dfs(_ index: Int, _ xor: Int) {
            if index == nums.count {
                res += xor
                return
            }

            // Skip or take
            dfs(index + 1, xor ^ nums[index])
            dfs(index + 1, xor)
        }

        dfs(0, 0)

        return res
    }
}

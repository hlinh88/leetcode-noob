class Solution {
    func subsetXORSum(_ nums: [Int]) -> Int {
        var res = 0 

        // For loop solution PRo vip
        func dfs(_ index: Int, _ xor: Int) {
            res += xor

            for i in index..<nums.count {
                dfs(i+1, xor ^ nums[i])
            }
        }

        // Skip or take 
        // func dfs(_ index: Int, _ xor: Int) {
        //     if index == nums.count {
        //         res += xor
        //         return
        //     }
        
        //     dfs(index + 1, xor ^ nums[index])
        //     dfs(index + 1, xor)
        // }

        dfs(0, 0)

        return res
    }
}

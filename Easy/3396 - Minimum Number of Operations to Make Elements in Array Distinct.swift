class Solution {
    func minimumOperations(_ nums: [Int]) -> Int {
        var nums = nums
        var map: [Int: Int] = [:]
        for num in nums {
            map[num, default: 0] += 1
        }
        
        var res = 0
        
        while map.count < nums.count {
            let count = min(3, nums.count)
            
            for _ in 0..<count {
                let removed = nums.removeFirst()
                map[removed, default: 0] -= 1
                if map[removed] == 0 {
                    map.removeValue(forKey: removed)
                }
            }
            
            res += 1
        }
        
        return res
    }
}

Solution().minimumOperations([2,2,13])

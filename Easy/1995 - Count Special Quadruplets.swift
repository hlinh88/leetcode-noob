class Solution {
    func countQuadruplets(_ nums: [Int]) -> Int {
        var res = 0
        var map: [Int: Int] = [:]
        map[nums[0] + nums[1], default: 0] = 1
        
        for i in 2..<nums.count {
            for j in i+1..<nums.count {
                res += map[nums[j] - nums[i], default: 0]
            }
            
            for j in 0..<i {
                map[nums[i] + nums[j], default: 0] += 1
            }
        }
        
        return res
    }
}

Solution().countQuadruplets([1,1,1,3,5])

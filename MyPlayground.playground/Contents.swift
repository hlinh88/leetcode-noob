class Solution {
    func countPairs(_ nums: [Int], _ k: Int) -> Int {
        var count = 0
        var map: [Int: [Int]] = [:]
//        for i in 0..<nums.count {
//            for j in i+1..<nums.count {
//                if nums[i] == nums[j] && (i * j) % k == 0 {
//                    count += 1
//                }
//            }
//        }
        
        for (i, num) in nums.enumerated() {
            for j in map[num, default: []] {
                if (i * j) % k == 0 {
                    count += 1
                }
            }
            
            map[num, default: []].append(i)
        }
        
        return count
    }
}

Solution().countPairs([3,1,2,2,2,1,3], 2)

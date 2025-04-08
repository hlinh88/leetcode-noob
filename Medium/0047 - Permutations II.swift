// Backtracking + HashMap

class Solution {
    func permuteUnique(_ nums: [Int]) -> [[Int]] {
        var res = [[Int]]()
        var map: [Int: Int] = [:]
        
        for num in nums {
            map[num, default: 0] += 1
        }
        
        var current: [Int] = []
        
        func backtracking() {
            if current.count == nums.count {
                res.append(current)
                return
            }
            
            for (num, freq) in map {
                if freq == 0 { continue }
                map[num, default: 0] -= 1
                current.append(num)
                backtracking()
                current.removeLast()
                map[num, default: 0] += 1
            }
        }
        
        backtracking()
        return res
    }
}

Solution().permuteUnique([1,1,2])

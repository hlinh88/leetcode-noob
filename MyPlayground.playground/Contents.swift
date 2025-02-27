class Solution {
    func shipWithinDays(_ weights: [Int], _ days: Int) -> Int {
        var l = weights.max()!
        var r = weights.reduce(0) { $0 + $1 }
        
        func isValid(_ capacity: Int, _ days: Int) -> Bool {
            var dayNeeds = 1
            var sum = 0
            for i in 0..<weights.count {
                if sum + weights[i] <= capacity {
                    sum += weights[i]
                } else {
                    sum = weights[i]
                    dayNeeds += 1
                }
                if dayNeeds > days { return false }
            }
            return true
        }
        
        while l <= r {
            var mid = l + (r - l) / 2
            print("L: \(l), R: \(r), M: \(mid)")
            if isValid(mid, days) {
                r = mid - 1
            } else {
                l = mid + 1
            }
        }
        
        return l
    }
    
  
}

Solution().shipWithinDays([1,2,3,1,1], 4)

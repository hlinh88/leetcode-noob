import Foundation


class Solution {
    func maximumSum(_ nums: [Int]) -> Int {
        var res = -1
        var dict: [Int: [Int]] = [:]
        
        for num in nums {
            var calNum = num
            var total = 0
            while calNum > 0 {
                total += calNum % 10
                calNum /= 10
            }
            
            dict[total, default: []].append(num)
        }
        
        for value in dict.values {
            var value = value
            if value.count > 1 {
                value.sort()
                res = max(res, value[value.count - 1] + value[value.count - 2])
            }
        }
        
        return res
    }
}

Solution().maximumSum([18,43,36,13,7])

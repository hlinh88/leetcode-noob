import Foundation

class Solution {
    func smallestNumber(_ pattern: String) -> String {
        let pattern = Array(pattern)
        var res = ""
        var nums = Array(1...9)
        var dCount = 0
        
        for (i, p) in pattern.enumerated() {
            if p == "D" {
                dCount += 1
            } else {
                for d in stride(from: dCount, through: 0, by: -1) {
                    res += String(nums[d])
                }
                nums.removeFirst(dCount + 1)
                dCount = 0
            }
        }
        
        for d in stride(from: dCount, through: 0, by: -1) {
            res += String(nums[d])
        }
        
        return res
    }

}

Solution().smallestNumber("IIIDIDDD")


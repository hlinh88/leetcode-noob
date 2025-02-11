import Foundation


class Solution {
    func removeOccurrences(_ s: String, _ part: String) -> String {
        var s = Array(s)
        var res = ""
        
        for i in 0..<s.count {
            res.append(s[i])
            
            if res.hasSuffix(part) {
                res = String(res.dropLast(part.count))
            }
        }
        
        return res
    }
}

Solution().removeOccurrences("axxxxyyyyb", "xy")

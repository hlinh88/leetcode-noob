import Foundation

class Solution {
    func countAndSay(_ n: Int) -> String {
        var res = "1"
        
        for _ in 1..<n {
            res = rle(res)
        }
        
        return res
    }
    
    func rle(_ str: String) -> String {
        var result = ""
        var previousChar = str.first!
        var count = 0

        for char in str {
            if char == previousChar {
                count += 1
            } else {
                result.append("\(count)\(previousChar)")
                previousChar = char
                count = 1
            }
        }
        
        result.append("\(count)\(previousChar)")
        return result
    }
}

Solution().countAndSay(4)

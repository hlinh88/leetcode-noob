class Solution {
    func countAndSay(_ n: Int) -> String {
        if n == 1 { return "1" }
        
        return rle(countAndSay(n - 1))
    }
    
    func rle(_ str: String) -> String {
        var chars = Array(str)
        var result = [String]()
        var count = 1
        
        for i in 1..<chars.count {
            if chars[i] == chars[i-1] {
                count += 1
            } else {
                result.append("\(count)\(chars[i-1])")
                count = 1
            }
        }
        
        result.append("\(count)\(chars.last!)")
        return result.joined()
    }
}

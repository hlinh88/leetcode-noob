class Solution {
    func maxDiff(_ num: Int) -> Int {
        let str = String(num)
        var a = str, b = str
        for char in str {
            if char != "9" {
                a = str.replacingOccurrences(of: String(char), with: "9")
                break
            }
        }
        if str.first! != "1" {
            b = str.replacingOccurrences(of: String(str.first!), with: "1")
        } else {
            for char in str.dropFirst() {
                if char != "0" && char != "1" {
                    b = str.replacingOccurrences(of: String(char), with: "0")
                    break
                }
            }
        }
        return Int(a)! - Int(b)!
    }
}
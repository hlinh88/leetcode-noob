class Solution {
    func restoreIpAddresses(_ s: String) -> [String] {
        let s = Array(s)
        var result: [String] = []
        func backtrack(_ i: Int, _ cur: inout [String]) {
            guard i != s.count else {
                if cur.count == 4 {
                    result.append(cur.joined(separator: "."))
                }
                return
            }
            
            if cur.count >= 4 { return }
            
            for end in i ..< min(s.count, i + 3) {
                let text = String(s[i ... end])
                if let num = Int(text), num >= 0, num <= 255, "\(num)" == text {
                    cur.append(text)
                    print(cur)
                    backtrack(end + 1, &cur)
                    cur.removeLast()
                }
            }
        }
        
        var cur: [String] = []
        backtrack(0, &cur)
        return result
    }
}

Solution().restoreIpAddresses("25525511135")

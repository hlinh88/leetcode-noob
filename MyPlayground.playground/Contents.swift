class Solution {
    func numberOfSubstrings(_ s: String) -> Int {
        var res = 0
        var s = Array(s)
        var cnt: [Character: Int] = [:]
        var l = 0
        
        for r in 0..<s.count {
            let char = s[r]
            cnt[char, default: 0] += 1
            
            while cnt.count == 3 {
                res += s.count - r
                let leftChar = s[l]
                if let val = cnt[leftChar] {
                    cnt[leftChar]! -= 1
                    if cnt[leftChar] == 0 {
                        cnt.removeValue(forKey: leftChar)
                    }
                }
                
                l += 1
            }
        }
        
        return res
    }
}

Solution().numberOfSubstrings("acbbcac")

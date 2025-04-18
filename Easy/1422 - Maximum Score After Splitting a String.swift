class Solution {
    func maxScore(_ s: String) -> Int {
        var s = Array(s)
        var score = s.filter { $0 == "1" }.count
        var res = 0
        
        for i in 0..<s.count - 1 {
            if s[i] == "0" {
                score += 1
            } else {
                score -= 1
            }
            
            res = max(res, score)
        }
        
        return res
    }
}

Solution().maxScore("011101")

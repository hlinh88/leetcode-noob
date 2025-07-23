class Solution {
    func maximumGain(_ s: String, _ x: Int, _ y: Int) -> Int {
        var res = 0
        var s = Array(s)
        
        for (pattern, gain) in [("ab", x), ("ba", y)].sorted(by: { $0.1 > $1.1 }) {
            var stack = [Character]()
            
            for c in s {
                stack.append(c)
                if String(stack.suffix(2)) == pattern {
                    res += gain
                    stack.removeLast(2)
                }
            }
            
            s = stack
        }
        
        return res
    }
}
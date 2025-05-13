class Solution {
    func lengthAfterTransformations(_ s: String, _ t: Int) -> Int {
        let mod = 1_000_000_007
        var freq = [Int](repeating: 0, count: 26)
        for c in s {
            freq[Int(c.asciiValue! - Character("a").asciiValue!)] += 1
        }
        
        for _ in 0..<t {
            var cur = [Int](repeating: 0, count: 26)
            let z = freq[25]
            if z > 0 {
                cur[0] = (cur[0] + z) % mod
                cur[1] = (cur[1] + z) % mod
            }
            
            for i in 0..<25 {
                cur[i + 1] = (cur[i + 1] + freq[i]) % mod
            }
            
            freq = cur
        }
        
        var res = 0
        for f in freq {
            res = (res + f) % mod
        }
        
        return res
    }
}
class Solution {
    func findKthNumber(_ n: Int, _ k: Int) -> Int {
        var current = 1
        var k = k - 1
        
        while k > 0 {
            var steps = 0
            var prefix1 = current, prefix2 = current + 1
            while prefix1 <= n {
                steps += min(n + 1, prefix2) - prefix1
                prefix1 *= 10
                prefix2 *= 10
                print("steps: \(steps), prefix1: \(prefix1), prefix2: \(prefix2)")
            }
            
            if steps <= k {
                k -= steps
                current += 1
            } else {
                current *= 10
                k -= 1
            }
            print("steps: \(steps), current: \(current), k: \(k)\n")
        }
        
        return current
    }
}

Solution().findKthNumber(13, 8)

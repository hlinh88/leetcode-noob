class Solution {
    func maxDifference(_ s: String) -> Int {
        var freq: [Character: Int] = [:]
        for c in s {
            freq[c, default: 0] += 1
        }

        var odd = Int.min, even = Int.max 
        for (_, f) in freq {
            if f % 2 == 0 {
                even = min(even, f)
            } else {
                odd = max(odd, f)
            }
        }

        return odd - even
    }
}
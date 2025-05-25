class Solution {
    func longestPalindrome(_ words: [String]) -> Int {
        var res = 0 
        var freq: [String: Int] = [:]

        for word in words {
            let w = Array(word)
            let reversed = String([w[1],w[0]])
            if let val = freq[reversed], val > 0 {
                res += 4
                freq[reversed] = val - 1
            } else {
                freq[word, default: 0] += 1
            }
        }

        for (word, val) in freq {
            let w = Array(word)
            if w[0] == w[1], val > 0 {
                res += 2
                break
            }
        }

        return res 
    }
}

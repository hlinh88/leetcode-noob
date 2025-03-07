// Input: s = "Let's take LeetCode contest"
// Output: "s'teL ekat edoCteeL tsetnoc"

class Solution {
    func reverseWords(_ s: String) -> String {
        var words = s.split(separator: " ")
        var res = ""
        
        for (i, word) in words.enumerated() {
            var word = Array(word)
            var l = 0, r = word.count - 1
            while l < r {
                word.swapAt(l, r)
                l += 1
                r -= 1
            }
            res += String(word) + (i == words.count - 1 ? "" : " ")
        }
        
        return res
    }
}
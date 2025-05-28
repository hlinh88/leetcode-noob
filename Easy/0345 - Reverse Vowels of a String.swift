class Solution {
    func reverseVowels(_ s: String) -> String {
        var s = Array(s)
        var l = 0, r = s.count - 1
        
        while l < r {
            if !isVowel(s[l]), !isVowel(s[r]) {
                l += 1
                r -= 1
                continue
            }
            if isVowel(s[l]) && isVowel(s[r]) {
                s.swapAt(l, r)
                l += 1
                r -= 1
                continue
            }
            
            if isVowel(s[l]) && !isVowel(s[r]) {
                r -= 1
                continue
            }
            
            if !isVowel(s[l]) && isVowel(s[r]) {
                l += 1
                continue
            }
        }
        
        return String(s)
    }
    
    func isVowel(_ c: Character) -> Bool {
        switch c {
        case "a", "e", "i", "o", "u", "A", "E", "I", "O", "U":
            return true
        default:
            return false
        }
    }
}
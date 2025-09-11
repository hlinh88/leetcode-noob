class Solution {
    func sortVowels(_ s: String) -> String {
        func isVowel(_ c: Character) -> Bool {
            switch c {
            case "A", "E", "I", "O", "U", "a", "e", "i", "o", "u":
                return true
            default:
                return false
            }
        }
        
        var map: [Character: Int] = [:]
        for c in s where isVowel(c) {
            map[c, default: 0] += 1
        }
        
        let sortedVowels: [Character] = ["A", "E", "I", "O", "U", "a", "e", "i", "o", "u"]
        var result = ""
        var index = 0
        for (i, c) in s.enumerated() {
            if !isVowel(c) {
                result += String(c)
                continue
            }
            
            while map[sortedVowels[index], default: 0] == 0 {
                index += 1
            }
            result += String(sortedVowels[index])
            map[sortedVowels[index], default: 0] -= 1
        }
        
        return result
    }
}

Solution().sortVowels("lEetcOde")

class Solution {
    func isValid(_ word: String) -> Bool {
        guard word.count > 2 else { return false }
        let vowels: Set<Character> = ["a", "e", "i", "o", "u"]
        let consonants: Set<Character> = ["b", "c", "d", "f", "g", "h", "j", "k", "l", "m", "n", "p", "q", "r", "s", "t", "v", "w", "x", "y", "z"]

        var containsVowel = false
        var containsConsonant = false
        
        for char in word {
            if vowels.contains(char.lowercased()) { containsVowel = true }
            else if consonants.contains(char.lowercased()) { containsConsonant = true }
            else if let _ = char.wholeNumberValue { continue }
            else { return false }
        }
        
        return containsVowel && containsConsonant
    }
}
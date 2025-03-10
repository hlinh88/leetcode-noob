// You are given a string word and a non-negative integer k.

// Return the total number of substrings of word that contain every vowel ('a', 'e', 'i', 'o', and 'u') at least once and exactly k consonants.

// Trick: Exactly K = At most K - At most K+1


class Solution {
    func countOfSubstrings(_ word: String, _ k: Int) -> Int {
        func atLeastK(_ k: Int) -> Int {
            let vowels: Set<Character> = ["a", "e", "i", "o", "u"]
            var vowelCount: [Character: Int] = [:]
            var consonantCount: Int = 0
            var word = Array(word)
            var res = 0
            var l = 0
            
            for r in 0..<word.count {
                let char = word[r]
                
                if vowels.contains(char) {
                    vowelCount[char, default: 0] += 1
                } else {
                    consonantCount += 1
                }
                
                while vowelCount.count == 5 && consonantCount >= k {
                    res += word.count - r
                    
                    let leftChar = word[l]
                    if vowels.contains(leftChar) {
                        vowelCount[leftChar]! -= 1
                        if vowelCount[leftChar] == 0 {
                            vowelCount.removeValue(forKey: leftChar)
                        }
                    } else {
                        consonantCount -= 1
                    }
                    
                    l += 1
                }
            }
            
            return res
        }
        
        return atLeastK(k) - atLeastK(k+1)
    }
}
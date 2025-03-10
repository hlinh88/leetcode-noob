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
                return res
            }
            
            return atLeastK(k) - atLeastK(k+1)
        }
    }
}

Solution().countOfSubstrings("iqeaouqi", 2)

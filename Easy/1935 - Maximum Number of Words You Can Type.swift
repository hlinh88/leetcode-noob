// Input: text = "hello world", brokenLetters = "ad"
// Output: 1
// Explanation: We cannot type "world" because the 'd' key is broken.

class Solution {
    func canBeTypedWords(_ text: String, _ brokenLetters: String) -> Int {
        var broken = Set(brokenLetters)
        var words = text.split(separator: " ")
        var count = 0
        
        for word in words {
            count += 1
            for char in word {
                if broken.contains(String(char)) {
                    count -= 1
                    break
                }
            }
        }
        
        return count 
    }
}
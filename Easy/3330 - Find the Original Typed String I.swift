class Solution {
    func possibleStringCount(_ word: String) -> Int {
        var result = 1
        var lastChar = word.first!
        
        for char in word.dropFirst() {
            if char == lastChar {
                result += 1
            } else {
                lastChar = char
            }
        }
        
        return result
    }
}
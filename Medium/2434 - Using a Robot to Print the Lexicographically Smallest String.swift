class Solution {
    func robotWithString(_ s: String) -> String {
        var map: [Character: Int] = [:]
        for (i, c) in s.enumerated() {
            map[c, default: 0] += 1
        }
        
        var result: [Character] = []
        let alphabet = Array("abcdefghijklmnopqrstuvwxyz")
        var minCharIndex = 0
        var minChar: Character {
            return alphabet[minCharIndex]
        }
        var stack: [Character] = []
        
        for (i, c) in s.enumerated() {
            stack.append(c)
            map[c]! -= 1
            
            while minChar != "z", map[minChar, default: 0] == 0 {
                minCharIndex += 1
            }
            
            while !stack.isEmpty, stack.last! <= minChar {
                result.append(stack.removeLast())
            }
        }
        
        return String(result)
    }
}
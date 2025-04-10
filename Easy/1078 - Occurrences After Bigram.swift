class Solution {
    func findOcurrences(_ text: String, _ first: String, _ second: String) -> [String] {
        var words = text.split(separator: " ")
        var result: [String] = []
        
        if words.count < 2 { return result }
        
        for i in 0..<words.count - 2 {
            if words[i] == first && words[i+1] == second {
                result.append(String(words[i+2]))
            }
        }
        
        return result
    }
}

Solution().findOcurrences("we will we will rock you", "we", "will")

class Solution {
    func minAddToMakeValid(_ s: String) -> Int {
        var stack: [Character] = []
        
        for char in s {
            if char == "(" {
                stack.append(char)
            } else {
                if stack.last == "(" {
                    stack.removeLast()
                } else {
                    stack.append(char)
                }
            }
        }
        
        return stack.count
    }
}
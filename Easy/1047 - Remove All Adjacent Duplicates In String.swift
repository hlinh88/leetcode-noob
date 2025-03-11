// Input: s = "abbaca"
// Output: "ca"
// Explanation: 
// For example, in "abbaca" we could remove "bb" since the 
// letters are adjacent and equal, and this is the only possible move. 
// The result of this move is that the string is "aaca", of which only "aa" is possible, so the final string is "ca".

class Solution {
    func removeDuplicates(_ s: String) -> String {
        var stack: [Character] = []
        for char in s {
            if stack.isEmpty || stack.last != char {
                stack.append(char)
            } else {
                stack.removeLast()
            }
        }
        
        return String(stack)
    }
}
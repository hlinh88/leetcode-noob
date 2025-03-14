// Stack - Swap = Unbalance / 2

class Solution {
    func minSwaps(_ s: String) -> Int {
        var stack: [Character] = []
        var count: Int = 0
        for char in s {
            if char == "[" {
                stack.append(char)
            } else {
                if stack.isEmpty || stack.popLast() != "[" {
                    count += 1
                }
            }
        }
        
        return (count + 1) / 2
    }
}
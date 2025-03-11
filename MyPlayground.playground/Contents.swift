class Solution {
    func minLength(_ s: String) -> Int {
        var stack: [Character] = []
        for c in s {
            if stack.isEmpty {
                stack.append(c)
                continue
            }
            
            var lastStr = String(c) + String(stack.last!)
            if ["BA", "DC"].contains(lastStr) {
                stack.removeLast()
            } else {
                stack.append(c)
            }
        }
        
        return stack.count
    }
}

Solution().minLength("ABFCACDB")

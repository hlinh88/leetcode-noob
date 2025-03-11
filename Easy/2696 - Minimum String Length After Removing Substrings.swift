// Input: s = "ABFCACDB"
// Output: 2
// Explanation: We can do the following operations:
// - Remove the substring "ABFCACDB", so s = "FCACDB".
// - Remove the substring "FCACDB", so s = "FCAB".
// - Remove the substring "FCAB", so s = "FC".
// So the resulting length of the string is 2.
// It can be shown that it is the minimum length that we can obtain.

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

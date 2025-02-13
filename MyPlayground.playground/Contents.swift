import Foundation

class Solution {
    func reverseWords(_ s: String) -> String {
        var ans = s.split(separator: " ")
        
        print(ans.reverse())
        
        return ans
    }
}


Solution().reverseWords("  hello world  ")


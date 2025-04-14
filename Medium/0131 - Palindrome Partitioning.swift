// Backtracking

class Solution {
    func partition(_ s: String) -> [[String]] {
        var result: [[String]] = []
        var current: [String] = []
        var s = Array(s)
        
        func dfs(_ start: Int) {
            if start == s.count {
                result.append(current)
                return
            }
            
            for end in start..<s.count {
                let substring = String(s[start...end])
                print("start: \(start), end: \(end), substring: \(substring)")
                if isPalindrome(substring) {
                    current.append(substring)
                    dfs(end + 1)
                    current.removeLast()
                }
            }
        }
        
        dfs(0)
        print(result)
        return result
    }
    
    func isPalindrome(_ s: String) -> Bool {
        let s = Array(s.lowercased().filter { $0.isLetter || $0.isNumber })
        var left = 0
        var right = s.count - 1
        
        while left <= right {
            if s[left] != s[right] { return false }
            left += 1
            right -= 1
        }
        
        return true
    }
}

Solution().partition("aab")

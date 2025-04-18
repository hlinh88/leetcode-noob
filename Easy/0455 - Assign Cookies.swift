// Input: g = [1,2,3], s = [1,1]
// Output: 1
// Explanation: You have 3 children and 2 cookies. The greed factors of 3 children are 1, 2, 3. 
// And even though you have 2 cookies, since their size is both 1, you could only make the child whose greed factor is 1 content.
// You need to output 1.

class Solution {
    func findContentChildren(_ g: [Int], _ s: [Int]) -> Int {
        var g = g.sorted(), s = s.sorted()
        var l = 0, r = 0
        
        while l < g.count && r < s.count {
            if s[r] >= g[l] {
                l += 1
            }
            r += 1
        }
        
        return l
    }
}
//Input: haystack = "sadbutsad", needle = "sad"
//Output: 0
//Explanation: "sad" occurs at index 0 and 6.
//The first occurrence is at index 0, so we return 0.

class Solution {
    func strStr(_ haystack: String, _ needle: String) -> Int {
        var l = 0, r = 0
        var h = Array(haystack), n = Array(needle)

        while l < h.count {
            if h[l] == n[r] {
                l += 1
                r += 1
            } else {
                l = l - r + 1
                r = 0
            }

            if r == n.count {
                return l - r
            }
        }

        return -1
    }
}

Solution().strStr("sadbutsad", "sad");

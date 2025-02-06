//Input: s = ["h","e","l","l","o"]
//Output: ["o","l","l","e","h"]

class Solution {
    func reverseString(_ s: inout [Character]) {
        var l = 0, r = s.count - 1

        while l < r {
            var temp = s[l]
            s[l] = s[r]
            s[r] = temp

            l += 1
            r -= 1
        }

        print(s)
    }
}

var str: [Character] = ["h","e","l","l","o"]
Solution().reverseString(&str);

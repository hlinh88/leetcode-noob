//Write a function to find the longest common prefix string amongst an array of strings.
//
//If there is no common prefix, return an empty string "".

class Solution {
    func longestCommonPrefix(_ strs: [String]) -> String {
        var res = strs[0]

        for char in strs {
            while !char.hasPrefix(res) {
                res.removeLast()
            }
        }

        return res
    }
}

Solution().longestCommonPrefix(["flower","flow","flight"])

# Input: s = "abcabcbb"
# Output: 3
# Explanation: The answer is "abc", with the length of 3.

class Solution:
    def lengthOfLongestSubstring(self, s: str) -> int:
        charSet = set()
        l = 0
        res = 0

        for i in range(len(s)):
            while s[i] in charSet:
                charSet.remove(s[l])
                l += 1

            charSet.add(s[i])
            res = max(res, i - l + 1)

        return res


if __name__ == '__main__':
    print(Solution.lengthOfLongestSubstring(Solution, "pwwkew"))
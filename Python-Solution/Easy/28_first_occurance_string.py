# Input: haystack = "sadbutsad", needle = "sad"
# Output: 0
# Explanation: "sad" occurs at index 0 and 6.
# The first occurrence is at index 0, so we return 0.


class Solution:
    def strStr(self, haystack: str, needle: str) -> int:
        res = -1
        l, r = 0, 0
        h, n = len(haystack), len(needle)

        while l < h:
            if haystack[l] == needle[r]:
                r += 1

                if r == n:
                    res = l - n + 1
                    return res

            else:
                l = l - r
                r = 0

            l += 1

        return res


if __name__ == '__main__':
    print(Solution.strStr(Solution, "mississippi", "issip"))
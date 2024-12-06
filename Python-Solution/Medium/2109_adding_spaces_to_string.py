# Input: s = "LeetcodeHelpsMeLearn", spaces = [8,13,15]
# Output: "Leetcode Helps Me Learn"
# Explanation:
# The indices 8, 13, and 15 correspond to the underlined characters in "LeetcodeHelpsMeLearn".
# We then place spaces before those characters.

class Solution:
    def addSpaces(self, s: str, spaces: list[int]) -> str:
        result = []
        i, j = 0, 0
        n, m = len(s), len(spaces)

        while j < m:
            if i == spaces[j]:
                result.append(' ')
                j += 1
            result.append(s[i])
            i += 1

        while i < n:
            result.append(s[i])
            i += 1

        return ''.join(result)


if __name__ == '__main__':
    print(Solution.addSpaces(Solution, "LeetcodeHelpsMeLearn", [8,13,15]))
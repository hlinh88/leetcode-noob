# Input: s = "PAYPALISHIRING", numRows = 3
# Output: "PAHNAPLSIIGYIR"
# P   A   H   N
# A P L S I I G
# Y   I   R

class Solution:
    def convert(self, s: str, numRows: int) -> str:
        if numRows == 1: return s
        res = ""
        for i in range(numRows):
            increment = (numRows - 1) * 2
            for j in range(i, len(s), increment):
                res += s[j]
                if 0 < i < numRows - 1 and (j + increment - 2 * i) < len(s):
                    res += s[j + increment - 2 * i]

        return res

if __name__ == '__main__':
    print(Solution.convert(Solution, "ABCXYZASDASD", 3))


class Solution:
    def reverseString(s: list[str]) -> None:
        """
        Do not return anything, modify s in-place instead.
        """
        i = 0
        j = len(s) - 1

        while i <= j:
            temp = s[i]
            s[i] = s[j]
            s[j] = temp
            i += 1
            j -= 1

        print(s)


if __name__ == '__main__':
    s = ["h", "e", "l", "l", "o"]
    Solution.reverseString(s)

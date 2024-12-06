# Input: word = "abcde"
#
# Output: "1a1b1c1d1e"
#
# Explanation:
#
# Initially, comp = "". Apply the operation 5 times, choosing "a", "b", "c", "d", and "e" as the prefix in each operation.
#
# For each prefix, append "1" followed by the character to comp.
import collections


class Solution:
    def compressedString(self, word: str) -> str:
        i = 0
        current = 1
        res = ""

        while i < len(word):
            if i != len(word) - 1 and word[i] == word[i+1]:
                current += 1
            else:
                if current > 9:
                    n = current // 9
                    d = current % 9
                    res += (f"{9}{word[i]}" * n) + (f"{d}{word[i]}" if d != 0 else "")
                else:
                    res += f"{current}{word[i]}"

                current = 1

            i += 1

        return res

if __name__ == '__main__':
    print(Solution.compressedString(Solution, "mmmmmmmmmmmmmmmmmmzzzzzzzzzzzzzzzzzzyyyyyyyyyyyfvs"))
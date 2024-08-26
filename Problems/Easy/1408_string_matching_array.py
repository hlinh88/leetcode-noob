class Solution:
    def stringMatching(self, words: list[str]) -> list[str]:
        # res = []
        # for i in range(0, len(words)):
        #     for j in range(0, len(words)):
        #         if i == j:
        #             continue
        #
        #         if words[j] in words[i] and words[j] not in res:
        #             res.append(words[j])
        #
        # return res

        res = []
        fullStr = " ".join(words)
        for word in words:
            if fullStr.count(word) >= 2:
                res.append(word)

        return res

if __name__ == '__main__':
    print(Solution.stringMatching(Solution, ["leetcode","et","code"]))
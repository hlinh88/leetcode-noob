class Solution:
    def countBits(self, n: int) -> list[int]:
        dp = [0] * (n + 1)
        print("dp: ", dp)
        offset = 1

        for i in range(1, n+1):
            if offset * 2 == i:
                offset = i
                print("offset: ", offset)

            dp[i] = 1 + dp[i - offset]
            print("Update dp: ", dp)

        return dp

if __name__ == '__main__':
    Solution.countBits(Solution, 5)

    